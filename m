Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DD2770B
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034209; cv=none; b=cxrYTEPPGkAltFYM393dhYbJ5x9FcWXrykNsVy7mxngYVjOKzFLgWydynQ/e5m2jmdqzVaQPXvylZ3ehNNi4G9LUF9MRVt6vk/bTH/G/ztlnrHF7kTNyWRzId2v7Ysn4MLQPCCIR9vaAz9+jvGTFS2bnJE1FEtfot97CjiN6AAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034209; c=relaxed/simple;
	bh=PAyUH+eJb9uU1MZq6iUWRuAn2FNdfSmPenPoi2LzDW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNrCEUROCGwX21b/6WI4GvtIOZrtvhi48ne74gFbP+FKpghMNYPxHOT5XtwY1G0oPs0s2net1H9O8jUDjTKCwf8hNwAM7Goj42e2gj/aND6ZSThjMdqgir1oeFc1IF1C5aujzZS0iYgiwXs7JYdLFKiOf8nHmEIOfVF/nGVDB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHU5V2tR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHU5V2tR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2424C4CEC3;
	Sun, 27 Oct 2024 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730034208;
	bh=PAyUH+eJb9uU1MZq6iUWRuAn2FNdfSmPenPoi2LzDW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nHU5V2tRrL8bbg21Apkb40Ecl9jvv/vwra++wH1jMluR4j+GP+LoalfyzVFa2HTmj
	 mDHoB1brevWGLMfriaCEBXgtHZ9l/sUoQ43yLkapt0O4Aw1b0Zl5+UuDYKvptusnnh
	 5HbYpayVm7XCelmfX+W0b9J5P81Ii3jIic89iWkCA9rlCPjtnZ9Qj7xmXK2yXqUq3F
	 rmu4VZE8XVbFyrLEdgW/BgMnhDL3P/ZZVuihFGSE/dzppREaaNrwtHbY6vGLvFbz3T
	 UsLKAaeXtW9IXsJ56X2bAvKZdLBE77vrS1e+SJtfHi32SE6P30BTnClNPOCMJzFWff
	 xub5ru6Rr9xQA==
Message-ID: <6a7facff-7ee0-4ab2-83d5-b7702c8fcbfa@kernel.org>
Date: Sun, 27 Oct 2024 23:03:24 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Thorsten Glaser <tg@debian.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de> <874j4z253e.fsf@igel.home>
 <78d35395-2ef6-e55e-31f8-69cff5e47cdf@debian.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <78d35395-2ef6-e55e-31f8-69cff5e47cdf@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26/10/24 09:42, Thorsten Glaser wrote:
> On Sat, 26 Oct 2024, Andreas Schwab wrote:
> 
>> Already basic things like struct stat64 will break.
> 
> OK. Then, flag day, I guess.
> 
> How do we model this in Debian. Rename libc to libc6.1 and
> conflict with libc6 to force no coïnstallability, rename the
> architecture from m68k to… something else, or…?
> 
> But then, this does give the kernel side a chance to clean
> it up, even to model it like a completely new ILP32 port with
> no historical things to account for. And no kernel then needs
> to support both at the same time. (Or the new syscall ABI
> could use something different than trap #0, if that is even
> possible.)
> 
> How do we model this on the ELF side? (How do ARM and MIPS
> distinguish between their different same-bitness ABIs there?)
> Or do we just keep everything and old programs will just fail
> on their first syscall? (Another point in favour of not using
> the same trap.) Less toolchain changes. This also impacts how
> distros can handle this. From what mgorny writes Gentoo also
> doesn’t like rebootstrap-everything flag days with no simple
> upgradability, but it looks like this can’t be avoided with
> justifiable effort… unless the new ABI uses a different trap,
> the kernel supports both at the same time, and ELF mechanisms
> *and* paths (e.g. Multi-Arch) are used to distinguish them,
> so they can coëxist in the same system. (Although different
> M-A path would (I think) mean different Debian architecture,
> so it’d not be a clean upgrade either; crossgrades do work in
> theory these days, but only if the package versions are
> exactly identical, so this is very much not going to happen
> for m68k.)
> 
> So I think we need a rebootstrap with requiring users to
> reinstall (and then need no coexistence within the same
> running system).
> 
> Can we cheat and just not change the dpkg arch, GNU triplet,
> ELF headers etc. and just make sure that old syscalls won’t
> continue to work? (Or, some could even continue to work.)
> The danger of this is that if someone has an old .a lying
> around and links to it, they can get misbehaviour *if* it
> is affected by the ABI change.
> 
> Otherwise, I think we at least need something ELFy that
> binutils will refuse to link with older ELFs and go from
> there.
> 
> Looking at binutils… ARM has special code like:
> 
>        /* Cannot mix APCS26 and APCS32 code.  */
>        if ((in_flags & EF_ARM_APCS_26) != (out_flags & EF_ARM_APCS_26))
>          return FALSE;
> 
>        /* Cannot mix float APCS and non-float APCS code.  */
>        if ((in_flags & EF_ARM_APCS_FLOAT) != (out_flags & EF_ARM_APCS_FLOAT))
>          return FALSE;
> 
> But m68k doesn’t, so old binutils would link against new
> objects if we just add something like EF_* there. Again,
> the question is how much we can “cheat” for a low-user-
> count arch vs. how correct we want to do this. I’m not
> sure allocating a new EM_* distinct from EM_68K would be
> globally welcomed. (On that note, there’s EM_COLDFIRE, but
> Linux/coldfire never took off, did it?) No EI_OSABI use,

There is plenty of Linux on ColdFire, but all the m68k'isms apply the same.


> either. So, besides new EM_*, I can’t think of a way that
> old binutils won’t mix objects (and old kernels won’t try
> to execute new binaries), unless making things fail at the
> first syscall is an option, but getting one will mean more
> delays and more to change.
> 
> So many ways…
> 
> bye,
> //mirabilos
