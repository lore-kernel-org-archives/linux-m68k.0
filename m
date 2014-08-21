From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 0/2] m68k: propose move of platform coldfire
Date: Thu, 21 Aug 2014 21:47:56 +1000
Message-ID: <53F5DC6C.9070603@uclinux.org>
References: <1408590247-10875-1-git-send-email-gerg@uclinux.org> <CAMuHMdX2a4n3+wAOmF43NCSBKowJ6X72KDtjgKzW-vYCLGisbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:49986
	"EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753955AbaHUL5Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Aug 2014 07:57:16 -0400
In-Reply-To: <CAMuHMdX2a4n3+wAOmF43NCSBKowJ6X72KDtjgKzW-vYCLGisbQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 21/08/14 17:30, Geert Uytterhoeven wrote:
> Hi Greg,
>
> On Thu, Aug 21, 2014 at 5:04 AM,  <gerg@uclinux.org> wrote:
>> I propose that we move the arch/m68k/platform/coldfire directory to be
>> directly under arch/m68k.
>>
>> The current platform/ structure was inhereted from the move of m68knommu,
>> and is inconsistent with the existing m68k platforms (each having a
>> directory under arch/m68k).
>>
>> Moving platform/coldfire is quite strait forward. The following patches do a
>> move, and fix up the broken pathname comments.
> That sounds fine to me.
>
>> This does leave the question of what to do with the other directories still
>> under arch/m68k/platform, namely 68000 and 68360. Should they be moved in
>> the same way as coldfire?
> I think the 68*328 and 68360 SoC support can have their own directories,
> as these are platforms.
>
> However, these directories also contain 68000 and 68360 CPU support,
> which we may want to share with other platforms in the future, to support
> 68000-based Amigas, Ataris, Macs, Suns, ...
>
> But as that's a problem to fix when someone is working on it, it's fine
> for me to move these one level up, too.

Thanks for the feedback. I'll prepare patches that move these too then.

Regards
Greg
