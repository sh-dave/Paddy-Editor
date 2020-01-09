let project = new Project('Paddy-Editor');
project.addAssets('assets/**', {
    nameBaseDir: 'assets',
    destination: '{dir}/{name}',
    name: '{dir}/{name}'
});
project.addSources('Sources');

if (platform == 'debug-html5') {
    project.addLibrary('hxnodejs');
}
project.addLibrary('zui');
resolve(project);
