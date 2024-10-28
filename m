Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C80191F73
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101301; cv=none; b=rx4O84A20tG5LAInCnDiVjeLrhlip6ds+WZJHbf0uzTqyF1EJoADe03ELsRX0ehir8+Bru1b6K5v6EhG21J0QrDfaORTwPlvKSEymL40/Tz39eImqS2YiQxID/4Hcf6h6lIZw1OLDZVzBhdMy/s1DxFHW6YazP8ZYIcOed5v1ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101301; c=relaxed/simple;
	bh=5I7RgEK0jTep+tBHc6sfeE1WtzDLsO+hbq1mnMUZrJc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhKlCz4G9lwkXvGFyglDjwAvfFiEjPI+H5C6d2B77ECUUtDlh8gjWYaX29Wu+AF0cXoNtVYg0mYeUgM92oL7/UTuH/rEEEcIFlL4Mfho1hvwogHIYbgyCuj6VLFEruXnQgGoZ4Qzdfv/eGdXXFygCp5v8Pizic9M6/NRBW62iu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=olfHo4k4; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="olfHo4k4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wNwXQ4wn7Oc8WNg6e8XOpjs6tD+QH5tFAnDHurL2ZEg=; t=1730101299; x=1730706099; 
	b=olfHo4k4KwyUacrgiZs3TXeqPEh9cMiatV5Pk1qyZhLPo0V7VtGgaYNVYs2j4sOy0qmybqgkmND
	sX3ZczXf0LZA1tder698cLXJaue2CKmgtgL1pjA68GqReP0CinUvWrrvEr0ihusQxDYiGoQNjZFhJ
	sJ57zAbf/6zjqt3JGWZjqJVvswu9WugSKV6KbPrkhnGZBxBGH7aDIKpxA1e6O2HxxNPz8lSOtGa1i
	rJVDR/WGw1/e+k20PunpKm4CHrWZp4nR64+ZoeJ1UtiVn2vpnNVuLfT7bsnCQ79ACunlV49VQ2sED
	w2O9yEoqBKWj6uLdVFjyCcaZlIXYoFjlXkcA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KNc-00000003zjI-2ARP; Mon, 28 Oct 2024 08:41:36 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KNc-0000000289l-1FBl; Mon, 28 Oct 2024 08:41:36 +0100
Message-ID: <00d0d4d563b1f7cf0aefa0b4b6c5512bed504d68.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser
 <tg@debian.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
 debian-68k <debian-68k@lists.debian.org>, James Le Cuirot
 <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>, Andreas Schwab
 <schwab@linux-m68k.org>
Date: Mon, 28 Oct 2024 08:41:35 +0100
In-Reply-To: <CAMuHMdUL3YEW=UNtb4NNstejFFkguZd0LQ9V9xkgwAg74EQ=-Q@mail.gmail.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
	 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
	 <CAMuHMdUL3YEW=UNtb4NNstejFFkguZd0LQ9V9xkgwAg74EQ=-Q@mail.gmail.com>
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

Hi Geert,

On Sat, 2024-10-26 at 12:46 +0200, Geert Uytterhoeven wrote:
> On Fri, Oct 25, 2024 at 11:38=E2=80=AFPM Thorsten Glaser <tg@debian.org> =
wrote:
> > Additionally=E2=80=A6 has anyone done the simple =E2=80=9Cenable -malig=
n-int
> > in GCC, begin rebuilding stuff, first glibc, then others,
> > see what breaks=E2=80=9D? Is there sufficient effect that we cannot
> > incrementally change over?
>=20
> I guess there is code out there that checks for e.g. __mc68000__
> and will start doing the wrong thing...

Those are easier to fix though than trying to get LLVM work with
16-bit alignment. The former will just require removing that check.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
