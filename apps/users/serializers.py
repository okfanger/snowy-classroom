from rest_framework import serializers

from .models import User, MenuRouterMeta, MenuRouter, Role


# from .models import  PermissionAction, Permission


class UserRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


# class PermissionActionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = PermissionAction
#         fields = '__all__'


# class PermissionSerializer(serializers.ModelSerializer):
#     actionEntitySet = PermissionActionSerializer(instance=PermissionAction, many=True)
#
#     class Meta:
#         model = Permission
#         fields = '__all__'


class RoleSerializer(serializers.ModelSerializer):
    # permissions = PermissionSerializer(many=True, read_only=True)

    class Meta:
        model = Role
        fields = '__all__'


class MenuRouterMetaSerializer(serializers.ModelSerializer):
    class Meta:
        model = MenuRouterMeta
        fields = '__all__'


class MenuRouterSerializer(serializers.ModelSerializer):
    meta = MenuRouterMetaSerializer(many=False, read_only=True)

    class Meta:
        model = MenuRouter
        fields = '__all__'


class UserSerializer(serializers.ModelSerializer):
    role = RoleSerializer(many=False, read_only=True)

    class Meta:
        model = User
        # fields = '__all__'
        exclude = ['password']
