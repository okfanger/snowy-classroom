from apps.users.models import User

from .entity.classroom import *
from .entity.course import *
from .entity.exam import *
from .entity.group import *
from .entity.homework import *
from .entity.innermail import *
from .entity.question import *
from .entity.questionoption import *
from .entity.student import *
from .entity.teacher import *

from .relationship.examquestion_result import *
from .relationship.examstudent_attend import *
from .relationship.examstudent_attend import *
from .relationship.groupstudent_binder import *
from .relationship.studentcourse_attend import *
from .relationship.studentcourse_attend_task import *
from .relationship.studentcourse_leave import *
from .relationship.studenthomework_handin import *

