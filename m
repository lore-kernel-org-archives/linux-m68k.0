From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [git pull] m68k and m68knommu merge of includes
Date: Tue, 20 Jan 2009 17:44:35 -0800
Message-ID: <1232502275.5653.2.camel@brick>
References: <200901210058.n0L0wjdf005545@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <200901210058.n0L0wjdf005545@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: torvalds@linux-foundation.org, arnd@arndb.de, gerg@uclinux.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, sam@ravnborg.org, uclinux-dev@uclinux.org, zippel@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

On Wed, 2009-01-21 at 10:58 +1000, Greg Ungerer wrote:
> Hi Linus,
> 
> Please consider pulling this merge of the m68k and m68knommu include files.
> It comepletely moves include/asm-m68k to arch/m68k/include as part of the
> process, and ultimately results in both m68k and m68knommu arch code using
> the same set of includes. More cleanup can follow, but this is the
> necessary first step.
> 
> Thanks
> Greg

I think you need to check your arch/m68k/include/asm/swab.h as I get an
empty file when I pull this.  It looks like it needs a conditional 
include of swab_mm/swab_no similar to the other files.

Also, because of the byteorder changes, it looks like you don't need
a separate byteorder_mm/no as they both just include the generic
include/linux/byteorder/big_endian.h

Cheers,

Harvey

