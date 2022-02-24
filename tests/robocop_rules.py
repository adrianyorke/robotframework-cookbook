from robot.parsing.model.blocks import SettingSection, VariableSection, TestCaseSection
from robot.parsing.model.statements import Documentation, Variable
from robocop.checkers import VisitorChecker
from robocop.rules import RuleSeverity


class RecipeChecker(VisitorChecker):
    rules = {
        "5501": (
            "missing-mandatory-section",
            "Missing mandatory '%s' section",
            RuleSeverity.ERROR,
        ),
        "5502": (
            "missing-documentation-in-settings",
            "Missing mandatory Documentation setting in *** Settings ***",
            RuleSeverity.ERROR,
        ),
        "5503": (
            "missing-mandatory-field-in-doc",
            "Missing mandatory '%s' field in documentation",
            RuleSeverity.ERROR,
        ),
        "5504": (
            "missing-mandatory-variable",
            "Missing mandatory '%s' variable in *** Variables *** section",
            RuleSeverity.ERROR,
        ),
    }

    def __init__(self, *args):
        self.mandatory_sections = {
            "*** Settings ***": SettingSection,
            "*** Variables ***": VariableSection,
            "*** Test Cases ***": TestCaseSection,
        }
        self.mandatory_variables = {"${recipe}", "${level}", "${category}"}
        self.mandatory_doc_fields = {"PROBLEM:", "DISCUSSION:"}
        super().__init__(*args)

    def visit_File(self, node):  # noqa
        for section_name, section_type in self.mandatory_sections.items():
            for section in node.sections:
                if isinstance(section, section_type):
                    break
            else:
                self.report(
                    "missing-mandatory-section", section_name, node=node, lineno=0
                )
        super().visit_File(node)

    def visit_SettingSection(self, node):  # noqa
        for statement in node.body:
            if isinstance(statement, Documentation):
                self.check_mandatory_fields_in_doc(statement)
                break
        else:
            self.report("missing-documentation-in-settings", node=node)

    def visit_VariableSection(self, node):  # noqa
        var_names = set()
        for child in node.body:
            if not isinstance(child, Variable):
                continue
            var_names.add(child.name.lower())
        for var in self.mandatory_variables:
            if var not in var_names:
                self.report("missing-mandatory-variable", var, node=node)

    def check_mandatory_fields_in_doc(self, node):
        for field in self.mandatory_doc_fields:
            if field not in node.value:
                self.report("missing-mandatory-field-in-doc", field, node=node)
