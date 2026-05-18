#!/bin/bash

while true; do
    echo "=================================="
    echo "          星诺常用VPS脚本          "
    echo "=================================="
    echo "1. 回程线路测试"
    echo "2. 使用SpeedTest Akile测速"
    echo "3. 融合怪测试脚本"
    echo "4. NodeQuality测试"
    echo "----------------------------------"
    echo "5. Akile DNS修改"
    echo "----------------------------------"
    echo "6. 安装3X-UI面板"
    echo "7. 升级3X-UI面板"
    echo "8. 安装S-UI面板"
    echo "9. 升级S-UI面板"
    echo "10. Realm转发面板"
    echo "11. 懒人一键Sing-Box"
    echo "12. 更多功能"
    echo "----------------------------------"
    echo "0. 退出脚本"
    echo "=================================="
    echo ""
    read -p "请输入选项（0-12）: " input

    if [ "$input" -eq 0 ]; then
        echo ""
        echo "感谢使用！脚本已退出。"
        exit 0
    elif [ "$input" -eq 1 ]; then
        echo ""
        echo "正在下载回程线路测试脚本..."
        echo "----------------------------------"
        curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh
        echo "----------------------------------"
        echo "测试完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 2 ]; then
        echo ""
        echo "正在下载并安装SpeedTest..."
        echo "----------------------------------"
        curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz | tar -xz && rm speedtest.* && mv ./speedtest /usr/local/bin/speedtest && speedtest -s 74653
        echo "----------------------------------"
        echo "测速完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 3 ]; then
        echo ""
        echo "正在下载并执行融合怪测试脚本..."
        echo "----------------------------------"
        curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
        echo "----------------------------------"
        echo "按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 4 ]; then
        echo ""
        echo "正在执行Akile DNS修改脚本..."
        echo "----------------------------------"
        wget -qO- https://raw.githubusercontent.com/akile-network/aktools/refs/heads/main/akdns.sh | bash
        echo "----------------------------------"
        echo "DNS修改完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 5 ]; then
        echo ""
        echo "正在安装3X-UI面板..."
        echo "----------------------------------"
        bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
        echo "----------------------------------"
        echo "3X-UI面板安装完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 6 ]; then
        echo ""
        echo "正在检测3X-UI面板安装状态..."
        echo "----------------------------------"
        if [ -d "/etc/x-ui" ] || systemctl is-active --quiet x-ui; then
            echo "检测到3X-UI面板已安装，正在升级..."
            bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) --upgrade
            echo "----------------------------------"
            echo "3X-UI面板升级完成！按任意键返回主菜单..."
        else
            echo "未检测到3X-UI面板，请先安装后再升级"
            echo "----------------------------------"
            echo "按任意键返回主菜单..."
        fi
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 7 ]; then
        echo ""
        echo "正在安装S-UI面板..."
        echo "----------------------------------"
        bash <(curl -Ls https://raw.githubusercontent.com/alireza0/s-ui/master/install.sh)
        echo "----------------------------------"
        echo "S-UI面板安装完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 8 ]; then
        echo ""
        echo "正在检测S-UI面板安装状态..."
        echo "----------------------------------"
        if [ -d "/etc/s-ui" ] || systemctl is-active --quiet s-ui; then
            echo "检测到S-UI面板已安装，正在升级..."
            bash <(curl -Ls https://raw.githubusercontent.com/alireza0/s-ui/master/install.sh) --upgrade
            echo "----------------------------------"
            echo "S-UI面板升级完成！按任意键返回主菜单..."
        else
            echo "未检测到S-UI面板，请先安装后再升级"
            echo "----------------------------------"
            echo "按任意键返回主菜单..."
        fi
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 9 ]; then
        while true; do
            clear
            echo "1. 海外线路"
            echo "2. 国内线路"
            echo "0. 返回主菜单"
            read -p "请选择下载源（0-2）: " realm_input

            if [ "$realm_input" -eq 0 ]; then
                break
            elif [ "$realm_input" -eq 1 ]; then
                echo ""
                echo "正在从GitHub下载..."
                echo "----------------------------------"
                curl -L https://github.com/wcwq98/realm/releases/download/v3.1.21/realm.sh -o realm.sh && chmod +x realm.sh && ./realm.sh
                echo "----------------------------------"
                echo "Realm安装完成！按任意键返回子菜单..."
                read -n 1 -s
                echo ""
                echo ""
            elif [ "$realm_input" -eq 2 ]; then
                echo ""
                echo "正在从国内源下载..."
                echo "----------------------------------"
                curl -L https://host.wxgwxha.eu.org/https://github.com/wcwq98/realm/releases/download/v3.1.2/realm.sh -o realm.sh && chmod +x realm.sh && ./realm.sh
                echo "----------------------------------"
                echo "Realm安装完成！按任意键返回子菜单..."
                read -n 1 -s
                echo ""
                echo ""
            else
                echo ""
                echo "无效选项，请重新输入"
                echo ""
                sleep 1
            fi
        done
    elif [ "$input" -eq 10 ]; then
        echo ""
        echo "正在执行懒人一键Sing-Box脚本..."
        echo "----------------------------------"
        bash <(curl -s https://raw.githubusercontent.com/fscarmen/sing-box/main/sing-box.sh)
        echo "----------------------------------"
        echo "Sing-Box安装完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    elif [ "$input" -eq 11 ]; then
        echo ""
        echo "正在执行更多功能脚本..."
        echo "----------------------------------"
        bash <(curl -s https://raw.githubusercontent.com/everett7623/vps_scripts/main/vps_scripts.sh)
        echo "----------------------------------"
        echo "脚本执行完成！按任意键返回主菜单..."
        read -n 1 -s
        echo ""
        echo ""
    else
        echo ""
        echo "无效选项，请重新输入"
        echo ""
    fi
done