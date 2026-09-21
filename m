Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01675172D8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Sep 2026 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031179; cv=none; b=fx2eTHc0bgq00YnqEAOY0bglYJ1n1KDeE8uo9SvmzxKTZfLHs4ronVgf+L+uHzKnHhqD95tCQGDkQPeUb1Fh/SNdZOnRkEVfPdc17DsIAMguE3Ar+shWI6S/4uK2Yppdd/hLEDWiKBA2jkvgX2esaMhVB4NwmDkAzFWcba0khVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031179; c=relaxed/simple;
	bh=VgwNYLzcFaCw310j5rnmlnCtDv8MD/s7kK28jF6R6pw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OPcuXYVozNZU7te88+Tmx1TAGaz+JLvxziIpSgUlFjDKDG8OMiKF74CaBnJwDGXl34MiJwhdu39VNaxobmiD2h1LfzIfiZ05Kk/Cm7treJF/oKs3IvChX2nsPmWzaLcysRMHotoS5kl09scKIdSVYwQWSnU3Pq8ZB30NM2Hp2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTCTb4uf; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTCTb4uf"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93910cc46c8so448495685a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Sep 2026 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790031175; x=1790635975; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AnVLy7hVyyuk/0W7+7zlLT1tXIW2bRF33ALHBs3iFIc=;
        b=dTCTb4ufYaT3rFW4tib96QsShLi0g76MSZKv4dxWgTBrLoPqxUZVN42MJa6cQSvX2h
         LPyHHlyHWuzE8ls9vZ5bo0bhHLZ0loQ/RhZQwQf1Uj+m9+Q4HsCXG6FLqu9JRH/97WrO
         SaXWSjUcX7S5t0njknTLL3DRBb6158esrD+roE3sb58vvBEWXwpJBu2mLuCEcF9dBXB4
         J60gwfmVEdEpkTziBHJ4FMcTvodWZuZ4CpmoxNWJL0BUK++Ky5hzpv64dOA9vuGc7Xsc
         ZCBV9fgMRq+L9JLs2x5nvD4IFWiwZKRlqfWbnhxzGI3tSc555Wh5lnpfvEkoea7Jchcc
         rCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031175; x=1790635975;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnVLy7hVyyuk/0W7+7zlLT1tXIW2bRF33ALHBs3iFIc=;
        b=mq29jXYFOoltwJ1CzXMAReq1KkCsUD/dZb0oYThPEHoQQXg4uTiAz77kyACrNPHKVl
         s70UGVW7zYULV7s/VJiTEa37Fp2d7OKQPgTtEYCTmPlYsjhwxfHrVShFylG9Ew2nCQSz
         J8JoE8iSUEqD6pcqJK1mK1YxBMF2i8PE3zbeNY71P/OxM/r0EpT+N+tO1fCZrmzrhymg
         WVaUwL5ZFS1QaY+KvzAH/WA9UNMRkaxePBX/cgEG8wZtfsPN4pneSULbBs2aN8s3vbat
         Kj6is6qlZnn5qx8+i2YyzWQLOLPRkbbSIW0t/7jLIBw7rERwKjyiSHEYxDEpdQoavEKY
         P25Q==
X-Forwarded-Encrypted: i=1; AKwUvBzb8t4rdZKVrp5WZVISCtmL4mjEachZm/g779qJB9IGxQlZXm77P27Jc2wDTTXkrUzKnpirN2sr/Xdn@lists.linux-m68k.org
X-Gm-Message-State: AFuF++njaKHJ5lKM2YZ9jlq+PEkyuoOnStRZ0+HZpASSpABHXN2RxVID
	RjryZ5ixrWnEnqysNBmlSe5GUydI8QPR4T6Pyh5pDPCcONgY8YF8b4Ik
X-Gm-Gg: AYBFou1gduo9g0OS6d+3xucsX7oMGHtRhCodhzbKC0Jg6mCfdd3SQ+O3q8TkgpJwPbb
	0/YGu89gsNnB9kdj42wCFSnXkc63k1rwwEmH0PdawCJyD6PSHNpVas0ORkEA3XRHJOzBy6swlPV
	EwePdwp9gFHp/0AYPthrxP8FiWGRSm6T6/pHxkXcov8220DHtMjgMsRXiKe6ERTe4cIScvYR1o0
	J6DflqeZzOsI+nRUeOEVKmes4Cuz1ICqif0+Cvdd3+rHgLxKxl7WZKoIl5JzdwRXV0kVaOmeWaJ
	PZYuggEtltPVnkdUndtVcXRFLSn5eNRCHjFd8pAJCwnlzBEjL28s7sH3HmgVwAtTSuhn4qpq5CB
	KGL2NmhjniEkXbilMvpAIrdlzrrHkSV0EvxzoEcjYiRIl4GKGten5PAZg4vlv1h26VHlTdJkTcc
	utj2u0eWXV8cdoulGfTEa3J+/b12N2UvuUdotUmn7em0oG05p0/JEsJFoKr6twAHBEBtg/NGX4j
	3hpD12gccN3H2aCG9UwuE53fhaUTXQ=
X-Received: by 2002:a05:620a:2687:b0:93b:d7a0:d9ec with SMTP id af79cd13be357-93c19a8f1e9mr76853985a.70.1790031174513;
        Mon, 21 Sep 2026 15:52:54 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:9935:58dc:cee6:1c26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bb35a7sm37428185a.39.2026.09.21.15.52.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:52:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <20260907091544.36558-1-hemanth.selam@gmail.com>
Date: Mon, 21 Sep 2026 18:52:52 -0400
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C647EC67-4CAD-480C-9A78-EF5A2C2D718F@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
 <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
 <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
 <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
 <20260907091544.36558-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 7, 2026, at 5:15 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:

> On Sun, Sep 06, 2026 at 02:46:04AM -0400, Josh Juran wrote:
>=20
>> What about the human reviewing its output?  Or am I misunderstanding
>> the meaning of "Signed-off-by"?
>=20
> You are not misunderstanding it.  My Signed-off-by certifies the DCO,
> but sending the patch also means I am answerable for what is in it, =
and
> on this one I did not look hard enough.

Thank you for accepting my question on its merits (despite the =
rhetorical barb I attached to it) and answering thoughtfully.  I could =
not have asked for more humility than you=E2=80=99ve shown in your =
reply.

> The wider lesson I am taking from this is that a large series does not
> get to be reviewed in bulk.  Each patch has to be read on its own, in
> context, before it goes out, and that is what I will be doing for the
> rest of this work.

Again, I couldn=E2=80=99t ask for more than that.  Thank you.

> Thanks for pushing on it rather than letting it through.

You=E2=80=99re welcome.  Thanks for listening.

Peace,
Josh

