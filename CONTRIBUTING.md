# Contributing to awvimrc

Thank you for your interest in contributing to awvimrc! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion for improvement:

1. Check if the issue already exists in the GitHub issues
2. If not, create a new issue with:
   - A clear, descriptive title
   - Detailed description of the issue or suggestion
   - Steps to reproduce (for bugs)
   - Your environment details (OS, terminal, shell, etc.)

### Submitting Changes

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/awvimrc.git
   cd awvimrc
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the existing code style
   - Test your changes on your system
   - Update documentation if needed

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add: brief description of your changes"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your fork and branch
   - Provide a clear description of your changes

## Development Guidelines

### Adding New Configurations

When adding support for a new tool or configuration:

1. Add the configuration file to the root directory
2. Update the `Makefile` with appropriate targets
3. Update the `README.md` to document the new feature
4. Test the installation on a fresh system if possible

### Makefile Conventions

- Use descriptive target names
- Add help text for each new target
- Include error handling where appropriate
- Test targets on multiple platforms when possible
- Use `.PHONY` for targets that don't create files

### Vim/Neovim Plugin Additions

When adding new plugins to the vimrc:

1. Add the plugin with `Plug` in the appropriate section
2. Document the plugin's purpose with a comment
3. Add any necessary configuration below the plugin list
4. Test that the plugin works with `:PlugInstall`
5. Update the README.md with the new plugin information

### Code Style

- **Bash/Shell Scripts**: Follow standard bash best practices
  - Use `set -e` for error handling
  - Quote variables properly
  - Use meaningful variable names

- **Makefile**:
  - Use tabs for indentation (required by Make)
  - Add comments for complex logic
  - Group related targets together

- **Vim Script**:
  - Use clear, descriptive function names
  - Comment complex configurations
  - Group related settings together

## Testing

Before submitting a pull request:

1. **Test your changes locally**
   ```bash
   make check  # Check current installations
   make backup # Backup existing configs
   make <your-target> # Test your changes
   ```

2. **Test on clean system** (if possible)
   - Use a VM or container
   - Test the full installation process

3. **Verify documentation**
   - Ensure README.md is updated
   - Check that help text is accurate
   - Verify all links work

## Areas for Contribution

We welcome contributions in these areas:

- **Platform Support**: Adding support for more Linux distributions, BSDs, etc.
- **Tool Configurations**: Adding configs for new development tools
- **Plugin Suggestions**: Recommending useful Vim/Neovim plugins
- **Bug Fixes**: Fixing issues in existing configurations
- **Documentation**: Improving README, adding examples, creating guides
- **Testing**: Adding validation scripts or tests
- **Optimization**: Improving installation speed or reliability

## Questions?

If you have questions about contributing, feel free to:
- Open an issue with the "question" label
- Reach out to the maintainers

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on the code, not the person
- Help others learn and grow

Thank you for contributing to awvimrc!

