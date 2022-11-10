from rest_framework.permissions import BasePermission


# (1, '学生'), (2, '教师'), (3, '超级管理员')
class IsStudent(BasePermission):

    def has_permission(self, request, view):
        try:
            if not request.user.type:
                return False
            if request.user.type != 1:
                return False
            else:
                return True
        except AttributeError:
            return False

    def has_object_permission(self, request, view, obj):
        return True


class IsTeacher(BasePermission):

    def has_permission(self, request, view):
        try:
            if not request.user.type:
                return False
            if request.user.type != 2:
                return False
            else:
                return True
        except AttributeError:
            return False

    def has_object_permission(self, request, view, obj):
        return True


class IsAdmin(BasePermission):

    def has_permission(self, request, view):
        try:
            if not request.user.type:
                return False
            if request.user.type != 3:
                return False
            else:
                return True
        except AttributeError:
            return False


    def has_object_permission(self, request, view, obj):
        return True
