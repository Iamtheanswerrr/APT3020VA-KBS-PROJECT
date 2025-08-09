# APT3020VA-KBS-PROJECT
Family Tree Knowledge Base System (Prolog)

Overview

This project is a comprehensive Family Tree Knowledge Base System implemented in Prolog. It models detailed family relationships, gender, age, marital status, kinship, and other traits within a structured family database. The system enables advanced queries about family structures, including siblings, half-siblings, in-laws, ancestors, descendants, and kinship distances.

Designed as an enhanced and extensible knowledge-based system, it demonstrates the power of logic programming for representing complex real-world relationships with clear, logical rules.



Features

Gender Declarations: Identify individuals as male or female.

Age Classification: Track age, compare ages, and identify seniors.

Parent-Child Relations: Define mother, father, and general parent relationships.

Siblings & Half-Siblings: Differentiate full siblings, half-siblings, and in-law siblings.

Marriage & Divorce: Model married and divorced couples, including symmetric relations.

Kinship Relations: Query uncles, aunts, cousins, nieces, nephews, grandparents, and great-grandparents.

Advanced Kinship Queries: Calculate kinship distance and find shortest relational paths between individuals.

Marital In-Laws: Define mother-in-law, sibling-in-law, and general in-law relationships.

Driving Eligibility: Model driving capabilities based on age and licensing.

Fun Facts: Store interesting personal traits or hobbies for flavor.

Festival Participation: Demonstrate complex querying with festival participant outputs.



Project Structure

Prolog Knowledge Base (family_ID668211_KB.pl)
Contains all facts and rules representing individuals, family relationships, age data, marriage status, kinship definitions, and auxiliary predicates.



Documentation (docs/)

Comprehensive academic-style documentation detailing all components, rules, predicates, and example queries.

Example Queries (queries.pl)

Sample Prolog queries demonstrating how to retrieve information such as siblings, uncles, cousins, kinship distances, and more.



Getting Started

Prerequisites

SWI-Prolog installed on your machine.



Installation

Clone this repository:

bash
Copy
Edit
git clone https://github.com/Iamtheanswerrr/APT3020VA-KBS-PROJECT.git
cd fAPT3020VA-KBS-PROJECT
Open SWI-Prolog and consult the knowledge base:

prolog
Copy
Edit
?- consult('family_ID668211_kb.pl').
Usage
Run queries directly in the Prolog console. Examples include:

prolog
Copy
Edit
?- sister(rachel, sophia).
true.

?- uncle(oliver, emma).
true.

?- cousin(X, luke).
X = emma ;
X = daniel.

?- half_sibling(mark, julia).
true.

?- mother_in_law(M, simon).
M = nina.

?- sibling_in_law(X, rachel).
X = ...

?- kinship_distance(emma, luke, D).
D = 3.

?- shortest_path(laura, mia, P).
P = [laura, nina, sophia, mia].

?- findall(X, family_member(X), List).
List = [...].



Query Examples

Find all sisters or brothers.

Identify uncles and aunts of a person.

Determine cousins and half-siblings.

Retrieve mother-in-law or sibling-in-law.

Calculate kinship distances and shortest kinship paths.

List all family members.

Check who can drive based on age and license.



Contributing

Contributions to extend the dataset, add new relationships, or improve documentation are welcome. Please submit pull requests or open issues for discussion.



License

This project is licensed under the MIT License.
