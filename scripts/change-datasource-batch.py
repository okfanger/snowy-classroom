import os, yaml
abs_project_path = '/Users/fang/Coding/WorkDesign/snowy-classroom/snow-services'
# pip install PyYaml
def update_yaml(file_path, datasource_conf):
    with open(file_path) as f:
        doc = yaml.safe_load(f)
    doc['spring']['datasource'] = datasource_conf
    with open(file_path, 'w') as f:
        yaml.safe_dump(doc, f, default_flow_style=False)

conf = {
    # 此处数据机密，暂不上传
}


services = [_ for _ in os.listdir(abs_project_path) if "service" in _]

for s in services:
    yaml_path = os.path.join(abs_project_path,s, 'src/main/resources/application.yml')
    update_yaml(yaml_path, conf[s])
    print(yaml_path)

