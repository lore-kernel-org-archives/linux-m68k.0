Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E4CA6F
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145117; cv=none; b=PjVaYISAbgs9nsp5OFwh2IBePGx8q3+5BDk16fGwZby1dSTN3mbfUQs1Jp4lzvJQn0YO/fTanzAgJ3oOxLfnzZJGY+WnfuE6TckqJEeSNTG90AIjsc7W1lIpxq5M9Ni7lcHGAb/ZrMba48o6zoZzyq+7aY3e+wvcTfDOtQ+3QKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145117; c=relaxed/simple;
	bh=rTgIq/E4CO57I7/jhJR5DicH2mwtvau7CWIvUOdgkX8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VJnmccd5KRI2DYIc1/+wR8vxxRUXKeSIM2ONJPdQ3pxkqT4oTvF+0IHxhSpqNdVc6S1KfQhkFRklkAxfuOsP994O1wLmurQKskdNbUQl103MbtmIte9yswkvojLwisP4PwhNT/ZLBXRzOVLB4FYq9lSJK1WDwKIYa8EjW3+q8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hEEzrgdV; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hEEzrgdV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dzbMa9sG/WrS5VkC/OU1IFRoEA7kgyV0cVYYexzxHso=; t=1750145113; x=1750749913; 
	b=hEEzrgdVQyXRB61BAB41oONVwQojl8uT2zNZV7890aWDVsk+yotW+CuKxiWH0Fzg4LDvDkEJ2hF
	wLpdkiI0b7TMoesjdIeM4BZyxSmqwNNc/96vUjjDF3GRdIVLHBJz4mV8sCx/Klcij3+WUEN5cmhCl
	TDKdV+K7+CqVc0Vu5N1W5l9H9TujlN0Dji85/Km0DufVlG5fJa1J+TRN7HANp1biTWVr8eoGO+YZW
	48p3/Ujh4tU6qu/04IosQVOBjELPdtCmD0AqvsnZHP+TDjvumWk0qEjAF1OqVs5IAbcdSKJnq9bad
	kbSDKUo95HcHscU25K2dm99Iq16k5wMZEqyQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRQgw-00000001aTR-3i1S; Tue, 17 Jun 2025 09:25:10 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRQgw-00000003oCF-2gra; Tue, 17 Jun 2025 09:25:10 +0200
Message-ID: <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, John Klos <john@klos.com>
Cc: debian-68k@lists.debian.org, linux-m68k <linux-m68k@vger.kernel.org>, 
 Libc-help <libc-help@sourceware.org>
Date: Tue, 17 Jun 2025 09:25:09 +0200
In-Reply-To: <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
	 <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
	 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Tue, 2025-06-17 at 09:02 +0200, Geert Uytterhoeven wrote:
> On Wed, 21 May 2025 at 04:15, John Klos <john@klos.com> wrote:
> > Should Linux maintain a 32 bit platform that has alignment issues becau=
se
> > programmers make bad assumptions?
>=20
> Linux (the kernel) does maintain it, and bug fixes are backported
> to stable trees.  The upstream kernel (outside the arch/m68k dir)
> has no problem fixing whatever alignment issues that pop up.

This might change in the future when Rust code becomes more dominant in the=
 kernel.

What's going to happen when Rust code becomes mandatory in key parts of the=
 kernel
and then we're unable to build it because we insisted on keeping the 2 byte=
 ABI?

> > Your argument is that ABI breakage is death, and that projects and the
> > world are better when we tell people to fix their broken code.
>=20
> "we don't break user space" is the #1 rule in the kernel[1].

Except when we do: https://lwn.net/Articles/605607/ ;-)

> > I agree that ABI breakage is a huge hurdle. At the same time, the ABI w=
ill
> > change to fix 32 bit time. Is there any good reason to NOT switch to 32
> > bit alignment at the same time the time changes are made? I can't think=
 of
> > any reason.
> >=20
> > So can we all agree that there's no reason to not change alignment when
> > the time changes are done?
>=20
> According to Andeas, here is no change to be made for 64-bit time_t[2].

That's not the question to ask though but rather whether the shift to 64-bi=
t
time_t changed the ABI and according to the analysis made at Debian, it did=
 [1].

Adrian

> [1] https://wiki.debian.org/ReleaseGoals/64bit-time

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
