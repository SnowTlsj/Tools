#!/usr/bin/env bash
## Mod: Build20221118V1
## 添加你需要重启自动执行的任意命令，比如 ql repo
## 安装node依赖使用 pnpm install -g xxx xxx
## 安装python依赖使用 pip3 install xxx


#------ 说明区 ------#
## 1. 拉取仓库
### （1）定时任务→添加定时→命令【ql extra】→定时规则【15 0-23/4 * * *】→运行
### （2）若运行过 1custom 一键脚本，点击运行即可
### （3）推荐配置：如下。自行在设置区填写编号
## 2. 安装依赖
### （1）默认不安装，因为 Build 20210728-002 及以上版本的 code.sh 自动检查修复依赖
### （2）若需要在此处使用，请在设置区设置


#------ 设置区 ------#
## 1. 拉取仓库编号设置，默认 SnowTlsj 仓库
CollectedRepo=() ##主仓库，示例：CollectedRepo=(2 4 6)
OtherRepo=() ##其他仓库示例：OtherRepo=(1 3)
## 2. 是否安装依赖和安装依赖包的名称设置
dependencies="yes" ##yes为安装，no为不安装
package_name="png-js date-fns axios@v0.27.2 dotenv got crypto-js md5 ts-md5 tslib @types/node request tough-cookie jsdom download tunnel ws js-base64 qrcode-terminal moment ds"


#------ 编号区 ------#
:<<\EOF
一、集成仓库（Collected Repositories)
2-SnowTlsj/RenXing
3-SnowTlsj/Nomal
4-KingRan/KR
6-feverrun/my_scripts
7-okyyds/yydspure
8-锦鲤偷撸
二、其他仓库（Other Repositories）
1-SnowTlsj/Nomal-BBK
2-环境开卡
3-KR开卡
4-青蛙开卡
5-yyds开卡
6-BBK
7-兔子
8-电信
9-萝卜
EOF


#------ 代码区 ------#
# 🌱拉取仓库
CR2(){
    ql repo https://ghproxy.com/https://github.com/SnowTlsj/RenXing.git "jd_|pkc_|kanjia_|me_|a_|jdCookie.js" "" "^jd[^_]|USER|function|BBK|utils|ql|MR_util|sendNotify"
}
CR3(){
    ql repo https://ghproxy.com/https://github.com/SnowTlsj/Nomal.git "jd_|jdCookie.js" "" "^jd[^_]|USER|function|BBK|utils|MR_util|sign_graphics_validate|ql|sendNotify"
}
CR4(){
    ql repo https://github.com/KingRan/KR.git "jd_|jx_|jdCookie" "activity|backUp" "^jd[^_]|USER|utils|function|sign|sendNotify|ql|JDJR"
}
CR6(){
    ql repo https://github.com/feverrun/my_scripts.git "jd_|jx_|jddj_|getCookie|getJDCookie" "backUp/activity|backUp/card|backUp/py|backUp/utils/|backUp/test|jd_fruits.js|jd_pet.js|jd_factory.js|jd_health.js|jd_sgmh.js|jd_dreamFactory.js|jd_plantBean.js" "^(jd|JD|JS)[^_]|USER|sendNotify|utils"
}
CR7(){
    ql repo https://github.com/okyyds/yyds.git "jd_|jx_|gua_|jddj_|m|jdCookie" "activity|backUp" "^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator" "master"
}
CR8(){
    ql repo https://github.com/HarbourJ/HarbourToulu.git "jd_" "activity|backUp|jd_sign" "^jd[^_]|USER|utils|ZooFaker_Necklace|JDJRValidator_|sign_graphics_validate|jddj_cookie|function|ql|magic|JDJR|JD|sendNotify" "main"
}
for i in ${CollectedRepo[@]}; do
    CR$i
    sleep 10
done

OR1(){
    ql repo https://ghproxy.com/https://github.com/SnowTlsj/Nomal.git "a_|jdCookie.js" "" "^jd[^_]|USER|function|BBK|utils|MR_util|sign_graphics_validate|ql|sendNotify"
}
OR2(){
    ql repo https://github.com/feverrun/my_scripts.git "jd_opencard|getCookie|getJDCookie" "backUp" "^(jd|JD|JS)[^_]|USER|sendNotify|utils"
}
OR3(){
    ql repo https://github.com/KingRan/KR.git "jd_opencard|jdCookie" "activity|backUp" "^jd[^_]|USER|utils|function|sign|sendNotify|ql|JDJR"
}
OR4(){
    ql repo https://github.com/smiek2121/scripts.git "jd_|gua_" "" "ZooFaker_Necklace.js|JDJRValidator_Pure.js|sign_graphics_validate.js|cleancart_activity.js|jdCookie.js|sendNotify.js"
}
OR5(){
    ql repo https://github.com/okyyds/yyds.git "jd_lzdz|jdCookie" "activity|backUp" "^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator" "master"
}
OR6(){
    ql repo https://github.com/neUyNp8OIdO4Ejj/bbk_bak.git "a_" "NoUsed" "BBK" "master" "sh|bbk"
}
OR7(){
    ql repo https://github.com/HT944/MR.git "jd_" "NoUsed" "MR_util|" "main" "py|so"
}
OR8(){
    ql repo https://github.com/limoruirui/misaka.git "" "backUp|tools|JS|logs|login"  "tools|JS|logs|login"
}
OR9(){
    ql repo http://gitlab.radish.today/root/script.git "" "README" "sendNotify" "master"
}
for i in ${OtherRepo[@]}; do
    OR$i
    sleep 5
done



# 📦js依赖
install_dependencies_normal(){
    for i in $@; do
        case $i in
            canvas)
                cd /ql/scripts
                if [[ "$(echo $(npm ls $i) | grep ERR)" != "" ]]; then
                    npm uninstall $i
                fi
                if [[ "$(npm ls $i)" =~ (empty) ]]; then
                    apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm i $i --prefix /ql/scripts --build-from-source
                fi
                ;;
            *)
                if [[ "$(npm ls $i)" =~ $i ]]; then
                    npm uninstall $i
                elif [[ "$(echo $(npm ls $i -g) | grep ERR)" != "" ]]; then
                    npm uninstall $i -g
                fi
                if [[ "$(npm ls $i -g)" =~ (empty) ]]; then
                    [[ $i = "typescript" ]] && npm i $i -g --force || npm i $i -g
                fi
                ;;
        esac
    done
}

install_dependencies_force(){
    for i in $@; do
        case $i in
            canvas)
                cd /ql/scripts
                if [[ "$(npm ls $i)" =~ $i && "$(echo $(npm ls $i) | grep ERR)" != "" ]]; then
                    npm uninstall $i
                    rm -rf /ql/scripts/node_modules/$i
                    rm -rf /usr/local/lib/node_modules/lodash/*
                fi
                if [[ "$(npm ls $i)" =~ (empty) ]]; then
                    apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm i $i --prefix /ql/scripts --build-from-source --force
                fi
                ;;
            *)
                cd /ql/scripts
                if [[ "$(npm ls $i)" =~ $i ]]; then
                    npm uninstall $i
                    rm -rf /ql/scripts/node_modules/$i
                    rm -rf /usr/local/lib/node_modules/lodash/*
                elif [[ "$(npm ls $i -g)" =~ $i && "$(echo $(npm ls $i -g) | grep ERR)" != "" ]]; then
                    npm uninstall $i -g
                    rm -rf /ql/scripts/node_modules/$i
                    rm -rf /usr/local/lib/node_modules/lodash/*
                fi
                if [[ "$(npm ls $i -g)" =~ (empty) ]]; then
                    npm i $i -g --force
                fi
                ;;
        esac
    done
}

install_dependencies_all(){
    install_dependencies_normal $package_name
    for i in $package_name; do
        install_dependencies_force $i
    done
}

if [ "$dependencies" = "yes" ]; then
    install_dependencies_all &
fi

