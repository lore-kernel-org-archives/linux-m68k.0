From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: m68k: io{read,write} accessors
Date: Thu, 29 Aug 2013 02:09:56 -0700
Message-ID: <521F0FE4.90709@gmail.com>
References: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com> <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alexander Shiyan <shc_work@mail.ru>

On 08/29/2013 01:15 AM, Geert Uytterhoeven wrote:
> On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> It appears that m68k doesn't properly define the io{read,write}
>> functions. I get complaints like this from my compile testing:
>>
>> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
>> drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
>> function 'iowrite8_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
>> drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
>> function 'ioread8_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
>> drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
>> function 'iowrite16_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
>> drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
>> function 'ioread16_rep' [-Werror=implicit-function-declaration]
>
> This is a nommu config?
> If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.

Right, CONFIG_MMU=n.

Brian
