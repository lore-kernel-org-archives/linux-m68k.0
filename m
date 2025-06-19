Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC9239E8D
	for <linux-m68k@vger.kernel.org>; Thu, 19 Jun 2025 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312624; cv=none; b=WrK12wAXfAET4MMEyUGdrkrFdU3s7wPvVHb9SmtRnfelQWhM0WJpdCjOaVMmPLzs5i+VzaP/Z5MBN8pov8244TzKWSXS05sjXwvcxYSpVoQQWys8gtSW9uX26Devb5IoGdPnuSjCNJXtcOasi1IGWzSP6slKKDUHq5fonGpjvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312624; c=relaxed/simple;
	bh=asZ7c6cj01Akza++rGxYZ8R1DtjWAkxSYA6C5rPcVQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmE0h4MPMBfEvRHEOb1iqxrMDJt04PKP4Uh8DFdiLsWF3ELea3SZ6eIaNAT0jIH1YjX+Pevz1NurFyld5TffMQRAI+ExoXIKS3z7NjSmpEaiYuBPRzck9WjtQG6cblvlid/kH3UXiLc/6raUDjiRu4+75hw4yWt0NN9J3ozgS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbMmdkn1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbMmdkn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4323EC4CEEA;
	Thu, 19 Jun 2025 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750312623;
	bh=asZ7c6cj01Akza++rGxYZ8R1DtjWAkxSYA6C5rPcVQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bbMmdkn1ZCZ3B1ds0JduZHyi1nG8mS0mzUGQ2A8Gc3SBLoHLoT77GbOmMzGnLOg3b
	 prun1wrjq4/vNvO0qUtPOfO40XtrdkwrNiDR4ULfxVqcm5tIvCbeF4YZKG70wJJX3F
	 WLIo5PRiQSqTDxfw2TaDvke396QsX9sG0h++5dHuUNPVCwSl4dB+E6BkrYGHaui8rS
	 U4OBu9+LsTjt2eKLX21ZE39TgUVF+/uVHawvr5PiJFRmTxqr/oRPkbPn42bCHjV1CG
	 XsHG4F7IS+XiLJengc7L4iWHjkiccbbNysRMus03coqaPx6wtfdq24or89JnI/M83f
	 PbDduax4ioxPw==
Message-ID: <3803048d-d7d7-4ea8-8b32-d6cdece8be45@kernel.org>
Date: Thu, 19 Jun 2025 15:56:59 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Finn Thain <fthain@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
 <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org>
 <a140ad5e-35c5-4d14-beb4-d55a58fe0181@kernel.org>
 <931c08f8-1d1c-a317-5380-aa41b26bfed4@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <931c08f8-1d1c-a317-5380-aa41b26bfed4@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/6/25 15:31, Finn Thain wrote:
> On Thu, 19 Jun 2025, Greg Ungerer wrote:
>> On 19/6/25 08:29, Finn Thain wrote:
>>> On Wed, 18 Jun 2025, Greg Ungerer wrote:
>>>
>>>>> It's not really necessary to enforce this on Coldfire. However,
>>>>> since buildroot builds completely from source, it wouldn't even be a
>>>>> problem to change the alignment there as well.
>>>>
>>>> Yes, that is totally right in my experience. Certainly in my ColdFire
>>>> work it is pretty much always a build-everything approach via
>>>> buildroot or similar. I wouldn't think an ABI change would actually
>>>> worry too many ColdFire uses, they don't use distributions like
>>>> debian on them. (I would love to hear from anyone who does!).
>>>>
>>>
>>> That may work for end-users with a vendor BSP. But upstream developers
>>> need to be able to swap components. In general, when debugging I often
>>> have to run old binaries to find out whether I'm dealing with a deeper
>>> regression or not. Also, there is the bisection problem. It's not just
>>> a couple of distros who get to pay for an ABI break. It's the entire
>>> ecosystem.
>>
>> I am sure there is value in that for some. Like I said though that has
>> not been my experience with ColdFire. And by that I mean as the upstream
>> maintainer of ColdFire Linux support for +20 years. I pretty mush
>> _always_ build kernel + libs + user for testing even small kernel
>> changes.
> 
> OK, so you're not building binutils, newlib, gcc, gdb etc. with each
> revision. Do you use a board support package (BSP) from the vendor?

Vendor?
No vendors involved here. I mostly build for the default in-kernel
configurations, they are whole, do not require any extra external code.
As a maintainer I am only really interested in what is in kernel source.

I build updated toolchains and test on each major/minor release of
binutils, gcc. I do that via my simple-linux scripts
(http://https://github.com/gregungerer/simple-linux). They take a little
longer to run than 1 minute though :-)


>> My standard small system build takes less than 1 minute for everything.
>> Again, I am just relating my experience with this - admittedly probably
>> not typical of actual end users.
>>
>> FWIW even when I was working on shipping ColdFire based products my
>> firmware was always a complete update, no separate kernel and user space
>> updates. Typical of small embedded systems. I can't actually remember
>> many times I have run with a previously compiled user space.
>>
> 
> Given that on-chip RAM is scarce on Coldfire devices, it seems entirely
> plausible that an alignment change could result in ENOMEM after a rebuild
> -- unless the toolchain offered a choice of ABI.

Linux today doesn't really make much use of on-chip RAM on ColdFire.
It is too small to be useful for most things at the kernel scale.
There has been plenty of specialized code to use it over the years to
optimize for some particular application. Not sure how that is relevant
here though.

Granted many ColdFire platforms are short on RAM. Size is a problem.
New versions of packages almost always get larger, that is an on-going
problem. Heck even version to version kernel bloat is a problem.
Especially as the years go on.


> So this becomes a burden for those who maintain tooling that deals with
> ABIs, as well as for the vendor which has to support its BSP -- unless the
> vendor also happens to desire a choice of alignment (that's why I raised
> that question on 6/6).

Changing ABIs will surely affect many. Just keeping up with Linux development
in general is a on-going task, nothing comes fore free.

Regards
Greg



