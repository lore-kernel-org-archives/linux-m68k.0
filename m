Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6121D5A8
	for <linux-m68k@vger.kernel.org>; Sun,  9 Mar 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554451; cv=none; b=XhgFhJlH2JoAo+oPYI2iOCkRfgQk1h1llVetw2mNpaJW9vRj99Gk4VSMg+rSiLZUqwuHhxhokx09nXti40+Tiz/RMEqo/Q+Gh9QRm7gD5Yd6YvnS0difbjSDRKbMbBpTGV0FTVmTpJ8yFfK01m4i7lj8LX3NobcwziCQxCmTH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554451; c=relaxed/simple;
	bh=YecjUkemH3OWCfHSt26E4DlTZR8+Il1mrh0FK3Eiu5Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HTt0ofPL8ebXhpKzDXHY6+VQ6vmT/5q6gPLqy58Gm06iUrmP3Jgu3l+ssPSHWn8a3/8V/sR4OewcZrsExw74X63Toln564UqBxM9xDvkvK7mSVQ1D8B5Z4hsEPe5XnZfxsRrPFe5kDVOODjXfw+6I6w71cmQLOFtrmgos2P5/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Rjkukfoa; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Rjkukfoa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6japSLvTQnlOCS2BO0KTtkZI8Q8/EDQDLCLBk3KHBGQ=; t=1741554447; x=1742159247; 
	b=Rjkukfoaif/Kz01LJ3tXgQ4eID0IJgG+Cb49SFAowOq8eIsrnpLlZfUo55Kwd3VBs1TZhd3NDG1
	7h4zXt0og9fXK2i/wK3Q0AHg+SoBCWPZ4kIFS3dKiXJv20GDlOf7lzIdE6swer3KhCZZwM5jTJvZl
	xEj5fkTASN0KVuVCtHGVEISazAEOGKjYqR3ROCJ/J+smU+AcWAaEJxKQhxpkchZKDjBQ3lu7jUkaz
	9NIh78OXv1V3/Eq7W8GhqMHB03kDtXY0OzMQdpimkn+013MSsI/E81BZd70IKIoEP08YGdRqOXsvw
	ai8jkh7+0w1nGjSTkHZ4ikFpF08BUQ1D1t0g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1trNro-00000000yb1-3hVU; Sun, 09 Mar 2025 22:07:24 +0100
Received: from dynamic-078-054-178-139.78.54.pool.telefonica.de ([78.54.178.139] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1trNro-00000000Quh-2s0o; Sun, 09 Mar 2025 22:07:24 +0100
Message-ID: <437ae0d348933268cbd80553e27f38d1464d0c06.camel@physik.fu-berlin.de>
Subject: Re: Alignment discussion wiki page
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>
Date: Sun, 09 Mar 2025 22:07:24 +0100
In-Reply-To: <CAMuHMdVGKPxWVz-Cpz=28wDOQNfdx_=qWjeMJuD8timHeEzkMg@mail.gmail.com>
References: 
	<10be3c697f6702a63a20219160e671b1920b3d6c.camel@physik.fu-berlin.de>
	 <CAMuHMdVGKPxWVz-Cpz=28wDOQNfdx_=qWjeMJuD8timHeEzkMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Sun, 2025-03-09 at 11:43 +0100, Geert Uytterhoeven wrote:
> On Sun, 9 Mar 2025 at 11:38, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > I have started a page on the Debian wiki for discussing the alignment i=
ssue:
> >=20
> > =3D> https://wiki.debian.org/M68k/Alignment
> >=20
> > I will add more information over the coming days.
>=20
> I am positively surprised by the old SunOS's cc being able to fix
> typoes in printed messages (sturct -> struct ;-)

That typo is a result of the output being manually copied over from
an emulator screenshot, see the discussion in [1].

Adrian

> [1] https://mail-index.netbsd.org/port-m68k/2025/02/15/msg000925.html

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
