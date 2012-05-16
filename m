From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/3] m68k: consistently call ret_from_exception in entry
 code
Date: Wed, 16 May 2012 13:38:51 +1000
Message-ID: <4FB3214B.8030901@snapgear.com>
References: <1337064949-966-1-git-send-email-gerg@snapgear.com> <1337064949-966-2-git-send-email-gerg@snapgear.com> <m21uml6enz.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:51337 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964989Ab2EPDlC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 May 2012 23:41:02 -0400
In-Reply-To: <m21uml6enz.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


Hi Andreas,

On 15/05/12 18:18, Andreas Schwab wrote:
> <gerg@snapgear.com>  writes:
>
>> The ret_from_excption code is referenced by its function name, or by a label
>> set at the start of its code. Modify all uses to consistently just use the
>> function name "ret_from_exception".
>
> This will cause all branches to use the long variant, because
> ret_from_exception is a global symbol (and thus overridable in the ELF
> model).  The point of the additional local label is to allow the
> assembler to relax the branches.

Ah, ok. I was wondering why it was done this way.

The only problem cases for me in merging entry.S are the uses in:

     buserr
     trap
     ret_from_fork

buserr and trap are not hot paths, so do you see any issue making
them the long variant?

I don't know that even the ret_from_fork case is too much to worry
about either. We have done an awfull lot of work up to this point,
a couple of bytes more and a long branch won't make any real difference
to performance here.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
