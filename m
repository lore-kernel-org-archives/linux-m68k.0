From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: io{read,write} accessors
Date: Thu, 29 Aug 2013 14:07:06 +0200
Message-ID: <CAMuHMdWwyYEqRWrNa4r0AHxcz0H8dwX2piKV2fPD3Ph4iQSJDA@mail.gmail.com>
References: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
	<549050543.4739751377777470469.JavaMail.root@zim-store05.web.westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <549050543.4739751377777470469.JavaMail.root@zim-store05.web.westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Alexander Shiyan <shc_work@mail.ru>, Brian Norris <computersforpeace@gmail.com>

On Thu, Aug 29, 2013 at 1:57 PM, Greg Ungerer
<gregungerer@westnet.com.au> wrote:
> ----- "Geert Uytterhoeven" <geert@linux-m68k.org> wrote:
>> On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > It appears that m68k doesn't properly define the io{read,write}
>> > functions. I get complaints like this from my compile testing:
>> >
>> > drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
>> > drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
>> > function 'iowrite8_rep' [-Werror=implicit-function-declaration]
>> > drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
>> > drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
>> > function 'ioread8_rep' [-Werror=implicit-function-declaration]
>> > drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
>> > drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
>> > function 'iowrite16_rep' [-Werror=implicit-function-declaration]
>> > drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
>> > drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
>> > function 'ioread16_rep' [-Werror=implicit-function-declaration]
>>
>> This is a nommu config?
>> If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.
>>
>> Greg: is there any reason we can't use GENERIC_IOMAP=y for the nommu
>> case too?
>
> None at all. Thus this patch:
>
> http://www.spinics.net/lists/linux-m68k/msg06224.html

Sorry, I had forgotten about this.

> I have it in the m68knommu git tree, for-next branch. I intend pushing
> it for 3.12.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
