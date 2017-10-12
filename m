From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: mcf54415, spi nor and SD drivers
Date: Thu, 12 Oct 2017 15:56:29 +1000
Message-ID: <ffbf77cf-f01c-bba6-8f90-22f955dc519d@westnet.com.au>
References: <ba371285-38b5-5744-c386-1721bdf25f95@gmail.com>
 <30ab985a-70e5-3ca0-3bb1-ace05dd4ebc2@westnet.com.au>
 <218c4625-2ba7-668e-f6e3-e4145c69c3b0@sysam.it>
 <dc7ad189-0ddc-4852-1aba-9e6d0fba180b@westnet.com.au>
 <461bb3c3-822b-98d7-45cf-268cb2a764d5@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:47729
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751615AbdJLF4e (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 12 Oct 2017 01:56:34 -0400
In-Reply-To: <461bb3c3-822b-98d7-45cf-268cb2a764d5@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On 07/10/17 08:22, Angelo Dureghello wrote:
> On 06/10/2017 06:04, Greg Ungerer wrote:
>> On 06/10/17 09:06, Angelo Dureghello wrote: 
>>> Changes to spi-fsl-dspi.c driver is minimal, just mainly had to
>>> get some few settings from board c file.
>>>
>>> Now the issue is how to proceed, likely, spi-list gouys would complain
>>> i add board/platform support to the driver.>>> Is it better i send a patch for this stmark2 board.c before ?
>>
>> Sure, start with that. I don't mind if you send spi changes relevant to
>> the 54411 here either for review.
>>
> 
> well, to post the stmark2 patch there is only one issue btw:
> stmark2.c contains a dspi-patch reference.
> 
> #include <linux/spi/spi-fsl-dspi.h>
> 
> The above is a new file of few lines i created for the dspi
> board.c support.
> 
> So, maybe i should start posting the dspi patch. I attach the patches for
> your review, the patch n2 (spi-nor.c) is already under testing, so you can
> ignore it.

I don't see any problems with patch 0001.

I certainly have no problem with the m5441x clock changes, and the
DSPI address defines in patch 0003. In their own patch I could apply
those now.

In patch 0003 I would avoid superfluous white space changes - there
appears to be a couple of blank lines added/removed. You can only ask
what the spi-fsl-dspi driver maintainers think about adding board
support. 

Along with what Geert said I have been thinking about doing devicetree
support for the ColdFire boards for a while. But I have had no spare
cycles to really do any work on it.

Regards
Greg
