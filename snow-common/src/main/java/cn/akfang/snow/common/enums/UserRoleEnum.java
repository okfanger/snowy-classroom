package cn.akfang.snow.common.enums;

import org.springframework.util.ObjectUtils;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum UserRoleEnum {

    Student("学生", "student", 3, 3),
    Teacher("教师", "teacher", 2, 2);

    private final String chLabel;

    private final String EnLabel;

    private final Integer type;
    private final Integer roleId;


    UserRoleEnum(String chLabel, String enLabel, Integer type, Integer roleId) {
        this.chLabel = chLabel;
        this.EnLabel = enLabel;
        this.type = type;
        this.roleId = roleId;
    }

    /**
     * 获取值列表
     *
     * @return
     */
    public static List<String> getValues() {
        return Arrays.stream(values()).map(item -> item.EnLabel).collect(Collectors.toList());
    }

    /**
     * 根据 value 获取枚举
     *
     * @param value
     * @return
     */
    public static UserRoleEnum getEnumByValue(String value) {
        if (ObjectUtils.isEmpty(value)) {
            return null;
        }
        for (UserRoleEnum anEnum : UserRoleEnum.values()) {
            if (anEnum.EnLabel.equals(value)) {
                return anEnum;
            }
        }
        return null;
    }

    public String getEnLabel() {
        return EnLabel;
    }

    public String getChLabel() {
        return chLabel;
    }
}
