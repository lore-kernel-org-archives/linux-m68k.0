Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0512A47
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 03:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087664; cv=none; b=P9mA1qdifCocM7aLbLIQGlyR+4h5I4wrYPLxJJSZspCfWVHY1PWo2lEuTdLtcih/Yt0hqMmOOaDhICohpBaotF/J1hxrHsFOCw1RBslRPcWVw6jYm5HVlYFtq+i0gOXHvoW8lFa7MiewTttzM0qUqOQ2kAfSk9Cbx/rtx9Jk3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087664; c=relaxed/simple;
	bh=EhH5X6E/Ru9Qf3ngWSkzd3vHXDJgrd0i59Imv7ksxEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/2Q4YPDeY1rt1gBAOyb0K/zg2ZBTOQXhDTPSc7pwcaXvv0CXFnjX/6nJ9niTwJ+x6LQ9svvkDev+7VqHzjydltFe73EuyeOWtCYZb5yKdUa1sMpIGRz1xbQhOXUjv/PBd1Ok2iPjZ4LVUv3GrDz1w74IM/8BfvYhW6zxRp083w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8bKf5TV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8bKf5TV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88061C4CEC3;
	Mon, 28 Oct 2024 03:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730087663;
	bh=EhH5X6E/Ru9Qf3ngWSkzd3vHXDJgrd0i59Imv7ksxEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b8bKf5TVD0ahYvAjfSHzzMlfEHnmSBSMEtzCR5SAYpUxa7QPw8T3ZGJR5nybTpP2Q
	 VYP+/CKvrfdYRXArRq+Y5XuVoHRMYhmYAA3qR1lISfw5uijtx3FtqLQUlEXBtksbFk
	 MgwVKiDYTLALdAUSfsAFhujNUdXI15vdcALE4c0X4EfNm3DC4cNXsqgw1ltZEy9c71
	 3IS7vR7aacEJy3G+qsQTMUFdToQ8iaYMFWfVp2EVHd0ShLtr7ZpcQ1f0CfUGb7h9da
	 xBHu/LMHAoUG31/WmtA+4CIwfiAd9BV+9INQIj/dEuX1OgTD/pB/Zy3UHhN3MaKYcA
	 REHHTy5zWIyMA==
Message-ID: <c1c9031b-aae3-4398-bff5-06cd1d5e45a8@kernel.org>
Date: Mon, 28 Oct 2024 13:54:19 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de> <874j4z253e.fsf@igel.home>
 <99a649a3-9467-422b-bf86-2712ea00912e@app.fastmail.com>
 <b822873b-f0b5-ed42-9dfa-77581dc9ae1f@debian.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <b822873b-f0b5-ed42-9dfa-77581dc9ae1f@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28/10/24 13:19, Thorsten Glaser wrote:
> On Sun, 27 Oct 2024, Arnd Bergmann wrote:
> 
>> I think it makes sense to go through these anyway and annotate
>> them to document and enforce the alignment we actually want
> 
> That would be good in general, yes. I’d personally argue for
> using explicit padding members (please do NOT use __unused,
> rather __pad1 __pad2 etc. or __unused1, etc. as __unused is
> used (hah) by BSD code for the GCC attribute a lot) and in
> cases where nōn-natural alignment is needed, GCC __packed__
> plus explicit padding. That is easier to read than __aligned__.
> 
> TIL that GCC has a __warn_if_not_aligned__ attribute now,
> which could be useful, but mostly for the code that makes
> these assumptions, so not us here.
> 
>> padding. If all of them get fixed alignment, this would allow
>> switching -malign-int on independently for userspace and
>> kernel without changing the ABI. Any duplicated copies of
>> the struct definitions in userspace of course would need
>> the same changes.
> 
> That is… an interesting side effect and probably a good idea
> to decouple this… unless there are any *other* kernel-side
> changes we absolutely need for this that we don’t want to put
> atop via evolution, not revolution (i.e. whether there is any‐
> thing in the kernel/userspace boundary that direly needs to
> change, for this or anyway, and is a breaking change… though
> maybe even then).
> 
> 
> On Sun, 27 Oct 2024, Greg Ungerer wrote:
>   
>> There is plenty of Linux on ColdFire, but all the m68k'isms apply the same.
> 
> Ah, okay. All of it nommu though?

No, there is a few ColdFire family members with MMU, specifically the version 4
core parts (547x, 548x, 5441x and 5445x). All supported by Linux, and popular
with some because they are significantly faster then the 68060. I regularly
(as in every mainline rc and kernel release) test on the 5475, and recently I
was sent a 54418 board and test on that now too.

To be fair though I build complete embedded systems and don't generally rely
on distros for a user space. So a flag day API change would not bother me at all.
That may well not be true for all ColdFire users though.


> Is there anything special we need to do or must not to that
> relates to ColdFire? Anyone to put in the Cc list for that?

Nothing special or different that I can think of. The struct alignment used
is the same as for standard m68k, so the problem is the same. The only user
space visible differences I can think of is the slight difference in layout
for the ptrace pt_regs struct. And those elements are probably problematic with
the mix of bit fields short/long at the end.

Regards
Greg

