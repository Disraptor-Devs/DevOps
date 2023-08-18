Role Name
=========

The **terragrunt_runner** role is responsible for running terragrunt fmt,validate,plan, and apply on the terragrunt files that are passed in as module dependencies.

Requirements
------------

The runtime environment that will be responsible for running the ansible playbook this role is used in needs the following to be already installed:

- python
- ansible
- terraform
- terragrunt

The **module_depencies** variable has to be passed from the anible file that's using this role . The module_dependencies variable determines what infrastructure will be provisioned as well as the order in which it will be provisioned.

Example Playbook
----------------

We'll use this role in the delegator playbook. The delegator playbook will be present in each environment we have in a master-delegator folder (for e.g development,production):

    - hosts: localhost
      gather_facts: false
      vars:
        module_dependencies:
          - path/to/module1
          - path/to/module2
          - path/to/module3
      tasks:
    - name: Include terragrunt runner role for the current module
      include_role:
        name: ../../../roles/terragrunt_runner/1.0.0/
      with_items: "{{ modules }}"
      loop_control:
        loop_var: module_dependency

License
-------

BSD

Author Information
------------------

Shibule Elias Ndhambi.

<shibule.ndhambi@disraptor.co.za>
