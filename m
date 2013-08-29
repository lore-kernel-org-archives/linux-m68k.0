From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: io{read,write} accessors
Date: Thu, 29 Aug 2013 10:15:10 +0200
Message-ID: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
References: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alexander Shiyan <shc_work@mail.ru>

On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> It appears that m68k doesn't properly define the io{read,write}
> functions. I get complaints like this from my compile testing:
>
> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
> drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
> function 'iowrite8_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
> drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
> function 'ioread8_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
> drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
> function 'iowrite16_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
> drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
> function 'ioread16_rep' [-Werror=implicit-function-declaration]

This is a nommu config?
If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.

Greg: is there any reason we can't use GENERIC_IOMAP=y for the nommu
case too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
