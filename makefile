# file : makefile
#
#  Copyright (C) 2018  Joshua Barretto <joshua.s.barretto@gmail.com>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Non-configurable

SRC_ROOT = $(abspath .)
BUILD_ROOT ?= $(SRC_ROOT)/build

ifndef TARGET
  $(error No target defined, pass TARGET=<name>)
endif

# Configurable

INITRD_TAR ?= $(BUILD_ROOT)/initrd.tar
TAR = tar

# Non-configurable

BUILD_DIRS = $(BUILD_ROOT)

# Rules

.PHONY: all
all: tar

.PHONY: clean
clean:
	@rm -r -f $(INITRD_TAR)

$(BUILD_DIRS):
	@echo "Creating build directories..."
	@mkdir -p $@

.PHONY: tar
tar: $(BUILD_DIRS)
	@echo "Generating initrd..."
	@cp -r $(SRC_ROOT)/root/* $(BUILD_ROOT)/root/.
	@cd $(BUILD_ROOT) && $(TAR) cf $(INITRD_TAR) --format=ustar *
