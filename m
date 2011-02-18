From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Sat, 19 Feb 2011 08:12:11 +1000
Message-ID: <4D5EEEBB.7050708@snapgear.com>
References: <4D5DB83D.80205@snapgear.com>	<AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com> <AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:60689 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753870Ab1BRWOP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Feb 2011 17:14:15 -0500
In-Reply-To: <AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

Hi Geert,

On 19/02/11 01:24, Geert Uytterhoeven wrote:
> On Fri, Feb 18, 2011 at 12:27, Geert Uytterhoeven<geert@linux-m68k.org>  wrote:
>> On Fri, Feb 18, 2011 at 01:07, Greg Ungerer<gerg@snapgear.com>  wrote:
>>> I would like to put up for discussion a merge of the m68knommu and
>>> m68k arch branches.
>>>
>>> Attached is a script and patch that does a kind of brute force
>>> simplistic merge of the directories and files. (Thanks to Stephen King
>>> <sfking@fdwdc.com>  for the initial version of this script, and to
>>> Sam Ravnborg for the m68k includes merge script this was based on).
>>> Nothing outside of the arch/m68k and arch/m68knommu directories is
>>> touched, and in the end there is no more arch/m68knommu. To apply you
>>> simply run the script from the top of a current kernel git tree (I used
>>> 2.6.38-rc5 for testing) and then apply the patch.
>>
>> Building...
>
> Builds fine (all test configs), runs on ARAnyM.
>
> Let's go ahead?

What sort of timing do you think makes sense?
Is for 2.6.39 too soon?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
