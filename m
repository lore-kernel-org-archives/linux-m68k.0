Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5F2367D4
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821391; cv=none; b=iYUknCgT6Qvo6jgtn04uyzmAWVjJVEnb3KEySvmDBpuKpyOldoO06Uu9T+XDtKO60awLt23irSKwOzfTsi/rsqV2rPn0SO1eB59AnkRR8AVENXKxCuotabBqEFW6rPM0X4pEgX9D7De26mplo9sgNODgSWy7HDDfEhsCfAOh6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821391; c=relaxed/simple;
	bh=7Rxa/wLT17JrvdFr0ZGAfyzmjBmCEdr/08gumCuXvoc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMC8GaAL0b7vwBzE+st0BpGx/vkY5Fx/CRVRrVJroBAny68mWELH4gUr+OPq8qoE5/69EbZxLupOHNxRY2qg37rvNAJEFoTDXt42QqKV1EzQUYMITESDJfiUyNASgQxL7y7AObklss2/yg78BMXb3332k2YGCtqfu3JffIhR3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=VT70q2LW; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="VT70q2LW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kNs8lDwO2rBhAEegeob/0THdvmF9x+EpF8yw6R/eTGo=; t=1747821388; x=1748426188; 
	b=VT70q2LW7a+W8DW5FJmTruWQQsNzID2LP1+WVcSqQnXE8l3yI9wWTlSwkhvsG5nJ+aozayAP8mL
	04IRRNxeIvg2k0HJrFLO0XO4o7CDaKCGO2fOzPYqarSNJOEQGVl6caL3kVKI4d7XZOwUW9Kbesa9S
	JFFbu0eapnpJaVHYuPWGjPRc3/LwYRUTNMFh6hK+AwKzw+3QsEdulH+DmFBGlL+0Cz7PI5cM3CeNc
	M6FQx/ZtTQQ34BTVSS6Two57ebt8vm0zHFQyEGug4e1/BmxdWGBCpZKQ7JRZi7iSSZhhvjeexyTDY
	lR4l/rFxx7hgyEw42uBAPnw4lms3aWZb1/Xg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHgBV-00000003yhQ-0kb8; Wed, 21 May 2025 11:56:25 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHgBU-00000003NJA-44Z9; Wed, 21 May 2025 11:56:25 +0200
Message-ID: <dc21f446ee2cf0495c492a29bf26665894adc76c.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: John Klos <john@klos.com>, debian-68k@lists.debian.org
Cc: linux-m68k <linux-m68k@vger.kernel.org>, Libc-help
	 <libc-help@sourceware.org>
Date: Wed, 21 May 2025 11:56:24 +0200
In-Reply-To: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello John,

thank you so much for your very elaborate and convincing reply. You have
formulated this way better than me and collected all the important points
that made me come to my wish to change the default alignment to 4 bytes.

I just want to add two more comments below.

On Wed, 2025-05-21 at 01:59 +0000, John Klos wrote:
>=20
> > One does not age gracefully by pretending to be young. m68k does not
> > contribute anything by becoming the same as every other 32-bit big-endi=
an
> > platform.
>=20
> This is nonsense. The natural alignment for m68020, m68030, m68040, m6806=
0=20
> is 32 bit. That Linux didn't follow the SVR4 spec for ELF was an error.

Exactly. I actually went to the library to scan the only copy of the SysV A=
BI
I could find in Germany and put it up in the Debian Wiki to help foster the
discussion.

> I really want to know:
>=20
> Who gets to make the call about whether or not the change is made?

It should be the people who maintain the distribution.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
