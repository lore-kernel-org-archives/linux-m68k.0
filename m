Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E91EDA19
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741338919; cv=none; b=padl8SPzf5oBz/W9YNXUL0i594bPXqlwTRPoQTFSDZdubIIuWytItWp66xVXEPhInVfAB8dEEqIJ3JdnvFO26ADzkZfm4YijnF7oJt9yWhjqWBr+BqCKThWx3kjajZQGnIWuM9H7Y/6kZ7kz1Eyi4TMhtcMoFt3C4fT3V65S5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741338919; c=relaxed/simple;
	bh=oV+Zmq3swvvGTbNPzuFOkRVQV5N1AJGr7hewufWRdkQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f6LUBYl+LGbwmDG8XtyM9ApK2DM93vaiCd7y761b16vjzYLp+3nzfcps/hhM8QxpCixCQ23pXL9x/DdurQShgQ+jrMf6Y4ZcJ/ceJS2ql7NeThisKM2euvkqDvQHxv5RCMKcyG8poxpBva+Mb4wIh8t1n9WaB2HdnR6EpXjZc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HZGOpmwZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HZGOpmwZ"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741338903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV+Zmq3swvvGTbNPzuFOkRVQV5N1AJGr7hewufWRdkQ=;
	b=HZGOpmwZeDtvBshXRH9pxbogeLnwo9LSdNDNaB+0LJENivrNNg0mfNorlL+UckmbPPm4WL
	5yKXdzkJlGY3CES+E6SyFmkWFtig0/Am+TEBKh645jko0SqRYUq0xs+szA1neQP+ZPKUvZ
	mznBiNcRTnW88pPqVxZHjI81RAJJC1E=
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] m68k: mm: Remove size argument when calling strscpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <e5e10808-5cca-243b-304f-4aa8db1d30b6@linux-m68k.org>
Date: Fri, 7 Mar 2025 10:15:00 +0100
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5216B227-6174-4C0A-9126-B8861473A0D3@linux.dev>
References: <20250302230532.245884-2-thorsten.blum@linux.dev>
 <CAMuHMdUonC54g-XSt-EkNbEGxhkOWMxBc87Qtw0MyeXoPqDD4A@mail.gmail.com>
 <e5e10808-5cca-243b-304f-4aa8db1d30b6@linux-m68k.org>
To: Finn Thain <fthain@linux-m68k.org>
X-Migadu-Flow: FLOW_OUT

Hi Finn,

On 7. Mar 2025, at 00:24, Finn Thain wrote:
> On Thu, 6 Mar 2025, Geert Uytterhoeven wrote:
>> On Mon, 3 Mar 2025 at 00:07, Thorsten Blum wrote:
>>> The size parameter of strscpy() is optional and specifying the size =
of
>>> the destination buffer is unnecessary. Remove it to simplify the =
code.
>>>=20
>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>>=20
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> i.e. will queue in the m68k tree for v6.15.
>>=20
> The commit message says "simplify the code" which is only true if you=20=

> never scratch the surface (i.e. it's simple code if the reader is =
simple=20
> too...)

strscpy() automatically determines the length of the destination buffer
using sizeof() if the size argument is omitted. This makes the explicit
sizeof(m68k_command_line) unnecessary, so removing it shortens the code
without changing its behavior.

Both macro calls expand to the same code, and I find the shorter version
simpler to read (this doesn't mean that strscpy() itself is simple).

> Commit 30035e45753b ("string: provide strscpy()") was a good idea. It =
was=20
> easily auditable. But that's not what we have now.
>=20
> Patches like this one (which appear across the whole tree) need =
reviewers=20
> (lots of them) that know what kind of a bounds check you end up with =
when=20
> you ask an arbitary compiler to evaluate this:
>=20
> sizeof(dst) + __must_be_array(dst) + __must_be_cstr(dst) + =
__must_be_cstr(src)
>=20
> Frankly, I can't be sure. But it's a serious question, and not what =
I'd=20
> call a "simple" one.

I'm not sure I fully understand this part or how it's related to this
change. This patch doesn't change bounds checking, it just removes an
unnecessary macro argument.

Thanks,
Thorsten

