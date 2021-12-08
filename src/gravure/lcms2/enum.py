# -*- coding: utf-8 -*-
#
#       Copyright (c) Gilles Coissac 2021 <info@gillescoissac.fr>
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.
#
from enum import Enum, EnumMeta


class TagEnumMeta(EnumMeta):
    def __getitem__(cls, name):
        try:
            ret = super().__getitem__(name)
        except KeyError as ke:
            try:
                ret = cls(cls.from_tag(name))
            except ValueError:
                raise (ke)
        return ret

    def from_tag(cls, name):
        name = "{:<4}".format(name[:4])
        return int.from_bytes(name.encode(), byteorder="big")


class TagEnum(Enum, metaclass=TagEnumMeta):
    def to_string(self):
        return self.value.to_bytes(4, byteorder="big").decode()
