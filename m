From: Brian Norris <computersforpeace@gmail.com>
Subject: m68k: io{read,write} accessors
Date: Wed, 28 Aug 2013 11:36:22 -0700
Message-ID: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alexander Shiyan <shc_work@mail.ru>

It appears that m68k doesn't properly define the io{read,write}
functions. I get complaints like this from my compile testing:

drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
function 'iowrite8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
function 'ioread8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
function 'iowrite16_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
function 'ioread16_rep' [-Werror=implicit-function-declaration]

Brian
