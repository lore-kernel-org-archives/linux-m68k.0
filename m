From: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Wed, 23 Oct 2013 14:12:38 +0200
Message-ID: <5cbf031e8c962394a34615d18977f609@muaddib.hro.localnet>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
 <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de>
 <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com>
 <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de>
 <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([31.172.31.194]:43198 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753172Ab3JWMMu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Oct 2013 08:12:50 -0400
In-Reply-To: <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, tuomas.vainikka@kopteri.net, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>

On 2013-10-22 22:38, Michael Schmitz wrote:

> Ingo - could you add
> if (scmd->device->sector_size > 2048)
> sdev_printk(KERN_ERR, scmd->device, "Whoa - large secor size %d\n",
> scmd->device->sector_size);
> before the do_div calls, and see what that reports?

Ok, so, drivers/scsi/sd.c looks now as this:


         if (scmd->device->sector_size < 512) {
                 /* only legitimate sector_size here is 256 */
                 start_lba <<= 1;
                 end_lba <<= 1;
         } else {
                 /* be careful ... don't want any overflows */
                 u64 factor = scmd->device->sector_size / 512;
                 if (scmd->device->sector_size > 2048)
                      sdev_printk(KERN_ERR, scmd->device, "Whoa - large 
sector size %d\n", scmd->device->sector_size);
                 do_div(start_lba, factor);
                 do_div(end_lba, factor);
         }

... will rebuilt and install it then...

-- 
Ciao...          //    Fon: 0381-2744150
.     Ingo     \X/     http://blog.windfluechter.net

gpg pubkey: http://www.juergensmann.de/ij_public_key.
