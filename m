Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73521C9F5
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734983; cv=none; b=NyoD4vhqGxRe5yJYy/NRmoMXyv7rIV5BMnpY/zqCmipWQ4qKS5Ylfe2WG03X2RBBDc+oYHTWGjs5fagiE+bWL9Ue7WeVsVqmHbAAUmQLFt/Ie1YRAC2jDcMnGpL23zR0UpbV69DeblK++h075uzJZ7XvKbakXKSJpFEZLvK4bEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734983; c=relaxed/simple;
	bh=Jxd8iXTUfIz5zJ6W9H8JhFgpnxR2wrV3rnjcHrnADV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CMpFNXRAIwc5a++YlC6d6gET706TRQRRE4/voQ9TfgJB6Lk3beHdsZsO3j9JmRfkMeQeXXwIexljBlj3dCZzViaGUDI2zwH+OU/sxP1jjbIWaK8jdMSorpWMQYphTHOHcXoX5cVZfQffnlZWkLtEL2WvjyYEUSqpUh41zm1wF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=WwWCcWfH; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="WwWCcWfH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4/yqV+yx4zZsgP9Q5HFP/2dmmZYNH0J/Iv3cr7YibEc=; t=1747734981; x=1748339781; 
	b=WwWCcWfHAGcmUjywXbL/ioUpg+dHhgced3cXVNqBynrIUeilhViiELQe4N2RvynUXGUTEOtT5Ze
	Ca87ahtEmneBt9YL6stxf2Ntzn48flv8zRtG4Q47d8vGun2BYYAvwZWWyqCgsEZEoSwAcFHvPdBI7
	GrL5QDkA5c6rmopYd5KACYMLI7Mnnm/elG7OMs/dTRCWBrGekbSykHibvcqvLv9DS+KnOAY1xWKkp
	UNx/IevJ42r4wUUVZvh6Ugj9JMBVSKwT7g4M/PUv2Wm8LKXOWpk7iyGogP3M4UohdxrzKoH/qQtlq
	2TrkFyXjxJaH6zyOCOnocEGHxMzaZVVGAEqw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHJhq-00000001Dlw-19Uh; Tue, 20 May 2025 11:56:18 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHJhq-000000040xf-0N9n; Tue, 20 May 2025 11:56:18 +0200
Message-ID: <369e51f34d56b4a6299b16a63789f5ee63848bf3.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Florian Weimer	
 <fweimer@redhat.com>, James Le Cuirot <chewi@aura-online.co.uk>, debian-68k
	 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>, 
 Libc-help <libc-help@sourceware.org>
Date: Tue, 20 May 2025 11:56:17 +0200
In-Reply-To: <0d6414b6-539a-91bb-2aed-867e24816ca9@linux-m68k.org>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	  <8734d1kofn.fsf@oldenburg.str.redhat.com>
	  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	  <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <0d6414b6-539a-91bb-2aed-867e24816ca9@linux-m68k.org>
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

On Tue, 2025-05-20 at 19:46 +1000, Finn Thain wrote:
> On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:
>=20
> > The fact is that software is moving forward=20
>=20
> Right. That's why we now have "Qt for MCUs". The Qt developers aren't=20
> trying to sell Qt 6 into a market that doesn't have sufficient compute=
=20
> power. And yet, for some reason, that's what you're advocating. You seem=
=20
> to think that the Debian archive has not grown since Debian etch. I don't=
=20
> get it.

No, you seem to think that software has stopped moving since 1988 and for
some reason you enjoying criticizing people that try to keep a port alive.

You haven't contributed a single constructive comment to this whole discuss=
ion,
you just keep saying that you don't want changes but you also don't want to
help to fix problems.

This isn't helpful.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
