From: Laurent Vivier <Laurent@lvivier.info>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 15:32:13 +0100
Message-ID: <8E70C812-7878-494E-A2D8-66BB7402A74E@lvivier.info>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info> <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu> <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com> <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au> <B0EA0FB1-9FEF-4159-ADAB-B5C2EA910352@gmail.com> <Pine.LNX.4.64.0811052352001.26662@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:50323 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbYKEOct convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 09:32:49 -0500
In-Reply-To: <Pine.LNX.4.64.0811052352001.26662@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Joshua Juran <jjuran@gmail.com>, Brad Boyer <flar@allandria.com>, Riccardo <riccardo@kaffe.org>, geert@linux-m68k.org, linux-m68k@vger.kernel.org


Le 5 nov. 08 =E0 14:10, Finn Thain a =E9crit :

>
>
> On Wed, 5 Nov 2008, Joshua Juran wrote:
>
>> On Nov 5, 2008, at 2:31 AM, Finn Thain wrote:
>>
>>> On Tue, 4 Nov 2008, Joshua Juran wrote:
>>>
>>>> On Nov 4, 2008, at 12:06 PM, Brad Boyer wrote:
>>>>
>>>>> On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
>>>>>
>>>>> Hopefully there's a logical way to detect this upgrade
>
> ...
>>
>> It's probably a good idea for the kernel to know the address and =20
>> size of
>> the ROM
>
> No need (the less code the better).
>
> And passing just a checksum from the bootloader is still an awful hac=
k
> compared to probing for IWM or SWIM on a Mac II.

The SWIM chip can act like an IWM one and there is a procedure to know =
=20
in which mode it is.

If we suppose the SWIM chip on MacII is at the same address than the =20
IWM one, we should be able to use this procedure to know if it is an =20
IWM or a SWIM.

Regards,
Laurent
----------------------- Laurent Vivier ----------------------
"The best way to predict the future is to invent it."
- Alan Kay





--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
