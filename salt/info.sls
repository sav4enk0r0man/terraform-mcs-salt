exec uname command:
  cmd.run:
    - name: uname -a

show repo url:
  cmd.run:
    - name: echo "{{ pillar['repo_url'] }}"
