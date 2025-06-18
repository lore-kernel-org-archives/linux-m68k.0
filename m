Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F012E06EF
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251597; cv=none; b=rleFi15djGs8z63aJmlNrud+ZKO4uqIt1nDzKPXa9kOFIRfVd5Yn/uL0wrr3eMT2H7zO5Gw75HCmGJQG/bxj10jt8/iJlXN4ecWC4sfQNr+8xrtRRSYZY1WEgHUJzxchz1qgpqObalbyhEVAQeBRqoe2KeYBtD4AfGfmKMlZOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251597; c=relaxed/simple;
	bh=5AXFoe5XQ1i00S0OUmfW8xC3MZwiS6oqD1yLe+OOyXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw9ULhrUwWhRqT42I6IOr22IW4ktuNSoTnzWGdWAG9rSY9F5BorbD9YeqIauSzO/VUsOvVQ980MzW56wZmdl00+3eiejSfoId3kgaSAmQagX013nDVq3NS+z6Kpm9VRwGZrQ+MsVF5poxwAR2VNOwk0w3wHzC2ocFf8HQ/hXM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUCbh4oO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUCbh4oO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E72C4CEE7;
	Wed, 18 Jun 2025 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750251597;
	bh=5AXFoe5XQ1i00S0OUmfW8xC3MZwiS6oqD1yLe+OOyXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WUCbh4oO95vARHoS942+iNQaDnsZAOSStOL/8FdWUOn3f9CFaDOszcoXIHpnpZrVR
	 GrCiCAAvjg7G3GzYae1X0i4kEMKGxB5yf8YW0WAoNFg/Rpo1yiEfn5PTOWBnnC1iwS
	 TQhw9f4qPrm0FkHSb/Sd26e56gtJqfz8AZ4lsvoltUtI52W4+Kh+vrV6anR57FU8vD
	 L0mNEtbuq4dBw+45JPRrf4dktDDGTdVFSC+TxHkGAqhlBBNOskfVucTELR2F+VDG0u
	 7ofRRdhoU5gLQWS0g3z9Xp07HLNw1tALQNOMjnHqpMwbkYb6CVafOazNCxixzJygCk
	 dcKMiToxvgT4Q==
Message-ID: <07736e45-f71e-425a-8fff-3a11957d8353@kernel.org>
Date: Wed, 18 Jun 2025 22:59:53 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
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
 <6e0e0cf97b77d881b67916889d4b172c5bbdda00.camel@physik.fu-berlin.de>
 <CAMuHMdX7TS=ApEnQrcpGjyWY-mHrmE6zHYQLNh3CEdYS6c2UhA@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CAMuHMdX7TS=ApEnQrcpGjyWY-mHrmE6zHYQLNh3CEdYS6c2UhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 18/6/25 22:54, Geert Uytterhoeven wrote:
> Hi Adrian,
> 
> On Wed, 18 Jun 2025 at 14:27, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On Wed, 2025-06-18 at 22:21 +1000, Greg Ungerer wrote:
>>>> Could you please elaborate this a bit more, please?
>>>>
>>>> Coldfire is handled as a separate target via TARGET_COLDFIRE in GCC, so we
>>>> would certainly be able to toggle the alignment settings independent of
>>>> what's done on classic m68k.
>>>
>>> The net out is that it is the same gcc compiler, m68k-linux-gcc.
>>> ColdFire just needs specific code generation via command line switches,
>>> like -m5200 (or -m5206e or -m5307 or -mcfv4e, etc). This is the same way
>>> you would specify 680x0 level - m68020, -m68030, etc.
>>
>> Yes, but there is a TARGET_COLDFIRE macro as I mentioned above which could
>> be used to trigger which alignment to use by default. I don't see how that
>> would complicate things.
>>
>>> The bulk of the instruction set is the same. Asm code will look totally
>>> familiar to anyone who knows m68k :-)   One notable difference is that
>>> there is a more limited set addressing modes for some instructions.
>>
>> True, but you won't be able to run any classic m68k binaries on ColdFire
>> and the other way around, are you?
> 
> IIIRC if you use a proper subset of the user mode instructions, you
> can create binaries that run on both.

You might be right on that. If you chose the lowest common denominator
of ColdFire code generation, -m5200, then I seem to recall for user
space that would just be a subset of traditional 68k.

Regards
Greg

