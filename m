Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DB2DBF7B
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160272; cv=none; b=c7y21VFhQ2Vuo67ljUd3BzN3if39p9BBix0DmEdDRNhxk4nYbnOsDzLTqDvTiGv4l1bUHsPA2zPAz53GesJMYI4JSko6j9bYVxPvYynRcjzuqnqoc7CpnAx4sLJZ++APXyNqdSsJUYL7d8kOTMOmEU80P7IXSNn568OFNPt+sDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160272; c=relaxed/simple;
	bh=Y+zEe7kqy1YzjvfKJk39whjWD/GUim+WGO+paT1omrM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p8NVHZgl/s3Y3DQIIzp0p3cw78XH1dgx1Df5rIoy+2t1W6D6QX1ZBPS+lRKA4WPiIodBa6mfPPssekAnBM5V6wNb8KFPRBo2hne3Bs2/AUD/JfVxd3tV4Qh5GQXe7M+XobvvLDFhZLmdaEvjjf50oT09JfSPICsfdFir11laDAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=C6kGH0aG; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="C6kGH0aG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P4UIt7GFKzwP18FB8ljjgS/PMhDBVZoPrNkgrPjZ9F8=; t=1750160269; x=1750765069; 
	b=C6kGH0aGgodA/1CoNTAF/YFc+2doTohEzBbFDkjHkzJSksFDIxOgmEk+YpXvft5SaEFBT1SBTXO
	eZQ1YBjlEPGgvwYNoFbr/QmiWFnq0VdpE5xIVjhbuDAcTMKl9YWiDp/GTRvleiQn+3cK0Fp8MI4U7
	plLTsIxBs5BhEiNdPybKRAEmC5BlmCwZxSHlrPiGlJ83z7ztvojYzOvgTk7ny3BLAx3/vBS5e2007
	zmQet8OV/FIOX+dVJfQByb/BRjzDV7I/EkGYjvDqYL8oq2zABxEGRmGC1uclfl2zeKR2o7cKKQc/9
	QGP6cEUpSXnTrfxcYmt2Q+VER/PaQ8BnOTTA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRUdO-00000003g7X-29xl; Tue, 17 Jun 2025 13:37:46 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRUdO-00000000MsV-1Y69; Tue, 17 Jun 2025 13:37:46 +0200
Message-ID: <f0f2fe26ef68647025b5f5d99136867b11a752bc.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, linux-m68k
	 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Date: Tue, 17 Jun 2025 13:37:45 +0200
In-Reply-To: <CAMuHMdUxUSQ3uKstM96U3Taj_dyCM5siGHO8i9qAO5iVadoTqg@mail.gmail.com>
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
	 <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
	 <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
	 <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
	 <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com>
	 <730b54f202dac75ec23d59e7c90bb1b13bd30a58.camel@physik.fu-berlin.de>
	 <CAMuHMdUxUSQ3uKstM96U3Taj_dyCM5siGHO8i9qAO5iVadoTqg@mail.gmail.com>
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

On Tue, 2025-06-17 at 13:21 +0200, Geert Uytterhoeven wrote:
> > I'm not sure how this is relevant at all. What is the gross profit of t=
he NetBSD organization?
>=20
> IOW, you can have plenty of ABIs, if you have the manpower to create
> and maintain them.

Both Debian and Gentoo want to maintain the 4 bytes alignment ABI in the lo=
ng term.

I don't think there is a point to continue to maintain the 2 bytes alignmen=
t ABI.

For whom would we do that?

> > > > > Is this a Rust issue, or an LLVM issue?
> > > >=20
> > > > https://github.com/M680x0/M680x0-mono-repo/issues/10
> > >=20
> > > So you mean it's an LLVM issue.
> >=20
> > It's an issue on many projects that use things like tagged pointers etc=
.
>=20
> I know.  If you want to tag pointers, it is your responsibility to use
> unused bits (Hi Apple 24-bit).  When using the low bit(s) for tagging,
> you have to make sure the objects you are pointing to are sufficiently
> aligned. BTW, how does LLVM tag pointers to chars?

I don't know. I'm not an expert on the LLVM codebase even though I made som=
e
contributions. If you know how to address this issue I'm curious to hear ab=
out
the fix.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
