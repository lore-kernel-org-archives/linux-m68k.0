Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4911D9669
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851067; cv=none; b=ZK5x3dZAI59+wPNf4w5TUG/cIOAk/iKbbDZ0DROCRr6PV0ZOwaRPjiUiwLeSQqM8BNdeQBgJi12t7REVNW+Ls5Wl6zC9wkA/jX77cf7AKtV+PLPZUJ2y1eRo/D9lFN1TzXtCQUNktJOSy7x59E7yNLffyRM06jamJoOng3RuVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851067; c=relaxed/simple;
	bh=du2u9EDdQocIrvlrpqy4FZh2gY0rXsFPq1FoEVV/+LM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PZINvgIwyBx9jmr23i8IM1lLcMn3fXvVmZqxsnSamkKXqhS0x1Pu72cV3VzkpJTDQKz+rFxK3L9Wku9+QZbCYmWZYwvVxbnHUABj2yz4vpKwDkxYrBtS4mvZNoKCYzUVUrSPgXgcdYnWO3pQjJfgE/bELwcBu/tZrBNiiAARCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=mVzfVZ0D; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="mVzfVZ0D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kw6LjronDPDsOaANrKDpBE8RlXRmn25BNWdQljM+Qbw=; t=1729851061; x=1730455861; 
	b=mVzfVZ0DtdDlzdip2uhhkSefi0O/80+rWlTGcqNuBW7YSBC3uy3ntWCHyxcM8dEgn/5aDs1vfcQ
	gppT2SwhfLZFYNms5RAnLmK/SaiV75jhovNfbWH773kCPTMPGYotPUbygqVXJY9IiHABZdJ/qiJjv
	9LRpN7Y3RJ5qLbdRhD/PxvNTGU/E/OzBw1TPTHe686bRFKvar4tpEFXZrgKTgIjPkpQKBA6us/ER3
	uctc/mJpDct26Qp24SuiWk1mUcM1nYypphQoLKgP9wOT1V2EcyrlfaRfbff7nunR80nIO35f2yO7I
	eKkjENoP2nS6hcP7pHx9vZQfE+A91PG+FhQA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t4HHX-00000002zNe-2Z95; Fri, 25 Oct 2024 12:10:59 +0200
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t4HHX-00000003pvh-1eKi; Fri, 25 Oct 2024 12:10:59 +0200
Message-ID: <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>, James Le Cuirot	
 <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten
 Glaser	 <tg@mirbsd.de>
Date: Fri, 25 Oct 2024 12:10:58 +0200
In-Reply-To: <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Arnd,

On Fri, 2024-10-25 at 09:55 +0000, Arnd Bergmann wrote:
> I think the idea of using the generic syscall ABI (in particular
> the time64-only variant) makes sense if there is going to be a
> new ABI, and I can help figure out what needs to be done in the
> kernel for that.

I don't actually know whether this would be a completely new ABI
as m68k has supported 32-bit alignment through the "-malign-int"
switch for a long time.

> The question is really if it's already too late to do it now,
> given the scope of the project and the limited developer
> resources. Maintaining two ABIs in the kernel and toolchain
> longterm is likely going to make things harder, and phasing
> out the existing ABI completely will likely take more than
> a decade. I expect that this is the same timeframe (mid-2030s)
> by which we will be debating the removal of any 32-bit
> targets from the kernel, in particular if we also want to
> add 128-bit targets.

I was not talking about maintaining two separate ABIs and I don't
think it makes much sense to keep the old ABI around.

> Based on those experiences, I think there is a significant
> chance that adding a new ABI is going to make things harder
> to maintain for both distro and kernel maintainers rather
> than easier, regardless of how much better the new ABI is.

The m68k port is already half broken because of the 16-bit
alignment and I have to admit I starting to get tired of
people telling me that switching the default alignment is a
bad idea.

A current example is Python 3.13 which just crashes with the
default alignment but builds just fine with "-malign-int".

I really don't understand why there is such a big resistance of
switching a port over to a different alignment which allegedly
no one is using or maintaining.

Someone made a bad design decision 40 years ago and we're not
allowed to fix that because someone might run an old binary
from the 80ies on a current version of the Linux kernel.

> I also expect that a lot of users (of m68k kernels) are
> never going to get the benefits as they are already stuck on
> older userspace because of added bloat in new software
> releases. I assume you have better understanding than me
> of what m68k hardware is commonly used these days, and
> how constrained that is in practice.

Users with very slow hardware and without accelerators aren't
going to run a modern kernel anyway, so this argument is moot.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
