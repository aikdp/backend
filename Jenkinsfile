@Library('jenkins-shared-library') _

def configmap = [
    project: "expense",

    component: "backend"
]

if(! env.BRANCH_NAME.equalsIgnoreCase('main')){   	//true, if branch is feature branch

    nodeJSEKSPipeline(configmap)   //feature, this code executes
}
else{
    echo "Follow the process of PROD release"       //main-->this code executes
}   

