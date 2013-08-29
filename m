From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: m68k: io{read,write} accessors
Date: Thu, 29 Aug 2013 19:57:50 +0800 (WST)
Message-ID: <549050543.4739751377777470469.JavaMail.root@zim-store05.web.westnet.com.au>
References: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>, Brian Norris <computersforpeace@gmail.com>

Hi Geert,

----- "Geert Uytterhoeven" <geert@linux-m68k.org> wrote:
> On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > It appears that m68k doesn't properly define the io{read,write}
> > functions. I get complaints like this from my compile testing:
> >
> > drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
> > drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
> > function 'iowrite8_rep' [-Werror=implicit-function-declaration]
> > drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
> > drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
> > function 'ioread8_rep' [-Werror=implicit-function-declaration]
> > drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
> > drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
> > function 'iowrite16_rep' [-Werror=implicit-function-declaration]
> > drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
> > drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
> > function 'ioread16_rep' [-Werror=implicit-function-declaration]
> 
> This is a nommu config?
> If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.
> 
> Greg: is there any reason we can't use GENERIC_IOMAP=y for the nommu
> case too?

None at all. Thus this patch:

http://www.spinics.net/lists/linux-m68k/msg06224.html

I have it in the m68knommu git tree, for-next branch. I intend pushing
it for 3.12.

Regards
Greg
