# C Coding Guideline (Automotive Standard)

## 1. Naming Conventions
- **Global Functions:** `<ModuleName>_<ReturnType>_<FunctionName>` (e.g., `Phys_ui8_GetVelocity`).
- **Global Variables:** `g_<ModuleName>_<Type>_<VarName>`.
- **Struct Types:** Must end with `_s` (e.g., `struct Config_s`).
- **Typedefs:** Must end with `_t` (e.g., `uint8_t`, `State_t`).
- **Defines/Macros:** `SCREAMING_SNAKE_CASE`.

## 2. Formatting & Structure
- **Variable Declaration:** All variables **must** be defined at the beginning of the function scope.
- **Braces:** Opening curly braces `{` must start on a **new line**.
- **Control Flow:** Every `if` statement **must** have a corresponding `else` (even if it only contains a comment `/* Empty */`).
- **Indentation:** 4 spaces, no tabs.

## 3. Constraints
- Avoid dynamic memory allocation (`malloc`/`free`).
- No floating point math unless explicitly approved for the module.

---

# C++ Coding Guideline (Modern TDD Style)

## 1. Naming Conventions
- **Classes:** `PascalCase` (e.g., `PhysicsEngine`).
- **Methods:** `camelCase` (e.g., `calculateForce()`).
- **Local Variables & Parameters:** `camelCase` (e.g., `deltaTime`, `minX`).
- **Member Variables:** `m_camelCase` with trailing underscore (e.g., `m_mass`).
- **Interfaces:** Prefix with `I` (e.g., `IDisplay`).
- **Namespaces:** `lowercase`.

## 2. Formatting & Structure
- **Variable Declaration:** Define variables as close to their first use as possible (RAII).
- **Braces:** Opening brace on the same line (K&R style) or new line, but be consistent.
- **Modern Features:** Favor `nullptr` over `NULL`. Use `auto` for complex iterator types.
- **Indentation:** 4 spaces, no tabs

## 3. Best Practices
- Use Smart Pointers (`std::unique_ptr`) instead of raw pointers.
- Every class should be tested via Google Test (TDD).

---

# Python Coding Guideline (PEP 8)

## 1. Naming Conventions
- **Functions/Variables:** `snake_case`.
- **Classes:** `PascalCase`.
- **Constants:** `SCREAMING_SNAKE_CASE`.

## 2. Structure
- Indentation: 4 spaces.
- Maximum line length: 79 characters.
- Use type hints for function signatures: `def run(name: str) -> bool:`.

## 3. Logic
- Use List Comprehensions for simple loops.
- Always include `if __name__ == "__main__":` in executable scripts.