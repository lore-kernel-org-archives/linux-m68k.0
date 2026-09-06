Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA02E736A
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Sep 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677170; cv=none; b=GRHRxyWS+ynKQluKdCyq3SqvlSvzCj9OWiglubFj5M9ZbQ/gBiouPQliYJj7HAj+tLpBCW1h44weCn3czmNaGqN6D3nMiLFNtfLVUum9TwqQ7lYmApOkvm8tand/NlYhjW6SFcbKjiZPdjfGE5t9Ia6tZ4j6q14lMdFfrJwZu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677170; c=relaxed/simple;
	bh=sIlOoPDk5igeV9GNzkGYTdKPuLFWWhg7AMG8ajh5Tn8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KMOiW1H+0AT6YqeKeObnGFDnqhLQCX0d+ohCTSFxNDiNCTJM54q3gQFl+9qHfAdLPTf0KIJ3ZwqJnmiXPcjSWw5FhJR8VMtywafbcnlwYw3OFjY/Y6FPTP106iQnn/3rJ6ivykquqvO99AIXR1D5EzWoWwTTHbZoXgr5Bv8to+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ZfF1tz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ZfF1tz"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9399798cdd2so57871885a.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788677168; x=1789281968; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SKBAIjm/G1mUF16pDnpb3A8NBOTGrYWEeA499nT6IA=;
        b=F3ZfF1tzreO/SCGcNWdZhZFUMFUZkSwnyFlwYEpgTtR8DcOHar/XZMymBTm8zBNsKe
         Jf+ScsIEGvKHfNVayfxyoJSfUrpo8th/cveS0Am9OnM18rAWKRYcbPveVxedsGdDKU3L
         YY2smR7eKHFs4F49efJQFEO2bQViYVEvmxJL/xGEPQvl525Mx0Z1rWMuo8NRXIHyf1B7
         zfQHzPx7cu06XzwdIhnbaYnwrhsjO/3NuIVzBrmASbsWeqSDhPcKoNg8e1DLl2W6GLza
         MUInUiGjOIgbEPX2tgsP6o20W3SHCmBYPdK7cFQD7FKFAqlD93eXJFZAAss5Dw/tlkmG
         SF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677168; x=1789281968;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SKBAIjm/G1mUF16pDnpb3A8NBOTGrYWEeA499nT6IA=;
        b=pnQNmcsQ5/kcURYTT3Fdy8KZcerIvW/L9j2ZXvK8f9b7tR0tpqq7aFLK05dNjEoqxb
         ALHE+ePKk5O58efNsUFk4hsXAj5NyTBafDo6BDVEjr2yIEzCaxgcyFd3f0x2L1VJtfZ3
         mtjX8tLqxA09sP0iVgvWJJXhJbr3R8NJHEzPm/ppvn+2H2fI0MCPLbKK/7Z0x2A9EFDO
         qrnTcClyXg/dC5Ctbo/lPbpcf58bYSNnkw6VB7OCi0HcNOYs7PvOQt/1fnnZKG99lLEW
         gbn5qZX468fIUWV/2HoxEDcvHFWM82az7WAmpKg2/2ZYQTACkP/uD4zzNxz9LesP2WJ2
         L1Cw==
X-Forwarded-Encrypted: i=1; AKwUvBw/P19x+arA81tUcKV1sjL2Mma3CyUkMob/JcKCkkSzIWsTUtbvCetIE4GpX+PcUCmOUA7lO21XIEfu@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nEqjwtE0LFRg0iBEUjzeQbajv25vvMxwTY4iVP6TjzVwntdT/t
	nX+G7RtoUsh/RJQ4sbYQiyykATZarzGpKBtXUhDWuMif9NXDeY50bYRJ
X-Gm-Gg: AYBFou3GPvipdzTn0ila2iMiidd9tRFP0Cz+JmbPyn62UFGKXPdV2jtow4QY203NHPb
	pTBu2e/9F4tOYA+vTSzNMbOAIDGy8cCqF0+6z7PbG4Pr6RAUaOXbiGel599/b4bsBvUZGOIdBKC
	mNAZvDpKd9br+te2xCt6TDghn+y/ys9wM5f2ETfwqE141p5lKhrkUboOJRrNADioX3VDOjOr8+K
	mX1g5uRVUtXk830NcGtIpuc7ujxBD/urMdWFTdYnmwHjBfu6fmf2L9hyxGIe/9TeIwq8BObWk0Q
	QK220PLv1eu5fAighlzbOoyycvgmhafaRWGeAPLM2gFMLQ7PG1zrIBCjJyZCC5h7murUAE4F5Yy
	PaRQEUy/detHE4a6KWSdwBPxMpPVL5GijkZ4g9o81/uUI3hAd2ciRT/KJlxwg5AOmv9kuDbVZwx
	vLpG2xiuMrCHIlmPzDoJC44UiWxN+EQHmH9pyEU9737QeGYKjJBFk2cwcRYe9bawe7SmzvSv6ZM
	DVHV3oLtwQ=
X-Received: by 2002:a05:620a:4450:b0:939:4a44:5f99 with SMTP id af79cd13be357-93980324b44mr1510113985a.10.1788677167677;
        Sat, 05 Sep 2026 23:46:07 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:4590:6205:75b9:b340])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399cf10c7dsm174331885a.15.2026.09.05.23.46.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 23:46:07 -0700 (PDT)
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
In-Reply-To: <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
Date: Sun, 6 Sep 2026 02:46:04 -0400
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
 <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
 <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 6, 2026, at 2:43 AM, John Paul Adrian Glaubitz =
<glaubitz@physik.fu-berlin.de> wrote:

> On Sun, 2026-09-06 at 02:40 -0400, Josh Juran wrote:
>> On Sep 4, 2026, at 7:23 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:
>>=20
>>> Correct "reseting" to "resetting", reported by scripts/checkpatch.pl =
using
>>> the misspelling list in scripts/spelling.txt.  Only touches =
comments, no
>>> code changes.
>>>=20
>>> Assisted-by: Cursor:claude-opus-5
>>> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>>>=20
>>> - *	There are 2 common methods amongst the ColdFure parts for =
reseting
>>> + *	There are 2 common methods amongst the ColdFure parts for =
resetting
>>=20
>> Is there a reason to leave =E2=80=9CColdFure=E2=80=9D as is?
>=20
> The AI assistant probably never heard about ColdFire, so it assumed =
the spelling
> is correct ;-).

What about the human reviewing its output?  Or am I misunderstanding the =
meaning of "Signed-off-by=E2=80=9D?

Josh

