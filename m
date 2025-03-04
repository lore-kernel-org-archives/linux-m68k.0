Received: from server43.webgo24.de (server43.webgo24.de [185.30.32.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691491DBB13
	for <linux-m68k@vger.kernel.org>; Tue,  4 Mar 2025 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.30.32.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741065887; cv=none; b=L6guR6ac8duIuGzSGFm2cdBl5Q/PzRjVv1OGBz7t9uMSDwAhwd8hePmDV2MgNraoIiyYsvVB2E06zBJ2NLZM40EnXoWVzVL56RSFtx+HQW2OPIylktDk/pJ/L6jQLuiJzBScWYaaDDxee9dMcs5NTcN2i6EJ6x6riSy8TpNuI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741065887; c=relaxed/simple;
	bh=ZTzLpcaBRxBs99GqeNaW20Q0asKylpgUynf5whPfr8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzVq9GWwd3hCtjZIK0tLYelVDPlqrQS7gw1gdz8J4Lj6QE2VSac/Fh8s5qCBVgilAhsp+vX5uuaqrxGFsoFY2U0HU/W8u9bd+eHdPmjVlvuA5H2ZGp2M6h6u/RNTHskL1XYbYhbNZ8cDhltLTqAngHOG++bxjk0SbSHFpNMjzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de; spf=pass smtp.mailfrom=tho-otto.de; dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b=XTO56G4L; arc=none smtp.client-ip=185.30.32.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b="XTO56G4L"
Received: from earendil.localnet (dynamic-080-171-054-098.80.171.pool.telefonica.de [80.171.54.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server43.webgo24.de (Postfix) with ESMTPSA id BE9B64110ED7;
	Tue,  4 Mar 2025 06:24:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tho-otto.de; s=dkim;
	t=1741065880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTzLpcaBRxBs99GqeNaW20Q0asKylpgUynf5whPfr8k=;
	b=XTO56G4L/+xGusUCPt+qoxa3QppTylPoIbxfej5UEo6oKl5IPAGYfFD0ve2lu9bgnXA4Fc
	pJMtikQjRqao0HK2hUluXKt1nPNhRQoQ6TzuLCoJFFlXPlKbHCh4ReHvLMgbYDdvj6Wsoh
	cNwz6EE0+bUAbLu379QI09OJYooBMCmuDORasrMszWP+7RcCqAUQ/TwsSkk0XGeuW+PZ2a
	pmG8jZIh4N8zP0WJQwnvPxWc8Ixg3iOa5fdH21dDVqMAh1+t2fwNkPZkt/56gDRPGOcMs2
	HWBz1Zory1a312l/7OZwBTIQKBdUpCKc3TdFUJa3t+lrz8f4P6KrmRTByXBD6A==
From: Thorsten Otto <admin@tho-otto.de>
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k@vger.kernel.org
Subject: Re: Software FPU emulation in linux kernel
Date: Tue, 04 Mar 2025 06:24:30 +0100
Message-ID: <49758471.MN2xkq1pzW@earendil>
In-Reply-To: <20250303221012.GA7422@allandria.com>
References:
 <3374772.VqM8IeB0Os@earendil> <20250303221012.GA7422@allandria.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Montag, 3. M=E4rz 2025 23:10:12 CET Brad Boyer wrote:
> On the variants without the built-in FPU, it's
> expected that the FPU emulator handles all of it since that's faster
> than triggering the emulator for each FPU instruction used in FPSP.

Yes, that's why i was wondering that a lot of functions are not implemented.

> Well, most programs that use FPU instructions aren't going to use anything
> beyond the basics.

Thats true. But if they do, wouldn't it be better to just abort the program=
 so=20
the user will notice it, rather than continuing with totally bogus values?=
=20
Currently, uprint will just use the kernels printk. I guess that will just =
end=20
up in the syslog for most cases, and not even seen by the user.

> The 68881/68882 are kind of unusual in implementing
> all of that in hardware.

Its not really unusual. The x87 FPU has almost the same instructions.

> In practice, no. There's a lot of other issues as well. I seem to
> recall that it only supports the 020/030 and not the versions of
> the 040/060 without FPU.

Thats mostly a matter how it is integrated in the system. That will obvious=
ly=20
be totally different in my case.

> The advice
> has always been to use a full 68040/68060 or add a real 68881/68882
> chip to the 020/030 systems.

Sure. But obviously this is not always possible, otherwise we would not nee=
d=20
an emulator. Nowadays, 68EC040 are much easier to find than full 68040.

> Most existing 68LC040 chips also have the bug that causes missed
> page faults after software-emulated instructions as well

Oh, i didn't know that. But handling pagefaults is another thing. But freem=
int=20
does not manage virtual memory, so that should not be a problem here.





