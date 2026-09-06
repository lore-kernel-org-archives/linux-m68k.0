Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A8825B0BB
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Sep 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788676863; cv=none; b=ikIgn3r5mLoYhCcFFvxgEdaGMyxmkLzGab4iISWMXhKb1XCNsWHpRMxSkPU0wjt0NR4pRTtSVrU1A62XHF91uSJlv+izRNQa0N8dq4wIGKTAWAArlYSqYooomyqPkmEJl7rEdbkoMc11ZYM6/KSw5Dup73/vmZT5qcwqNVtq4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788676863; c=relaxed/simple;
	bh=DKsBa9ZraG+br+wS3RGaMdAkaeqP8KmJBWNDuSBRtos=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lC88Mf3dmzLAAmA6u5r9xDazZy0Yj+hvpbLVV1E9eJeEjW6AiksluwkECBiSmLWzzf+rzH7W2U1srOQ9T3dq6de/2rRuWG6+MdiTmMcGDgFi+OoZBb4YeGf2OrHsHVnQq8LiYkcq2gcteggs9oOfOld677j8SGKsZUnj1eIA5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKtoYOye; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKtoYOye"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9104956083aso11366996d6.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788676861; x=1789281661; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BoGJBejmDHmob0AE3eTfdjrKII854/Xb9FkvnCxeGR0=;
        b=KKtoYOye0Yt1L1WfNWltxweznvOc/mv7DvKx3lgckkRFZN7APOdLx0JfxPKh79loy4
         MCCnJSGhGsmFmljttrgmExERYgGTkO7QVTC27rv8qTvgI2YQrXIjrJhfKCmnPut3FmMa
         HPVIDU9BrzIgRvvv5188gMITjNFjsaiFCBBU9MM05z6Lcxz6cL69KV74MYRBOuWY27QJ
         T64DZuImfmFxHTeRb7HDsDmF3QGmguFuwgi3GiCJxZm6w9RtzkmQyvp2ZwJF6AZ3Bw3+
         UPS8z9wAZGRSDYN55zCF026mbTnhJRYZQTV7YfDgQjvy91qzGPSxdd5kInnCs7xk12g2
         955g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788676861; x=1789281661;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoGJBejmDHmob0AE3eTfdjrKII854/Xb9FkvnCxeGR0=;
        b=BoS3GQVRazAu+ZmU6a2z0Ki96gls2rJWNFbY/A++tRe5sOyMjkphXh2qoqX9RDgYyh
         1nOy1PFl7b/PUlVfHRpTO3Fej5jF8CRNmKppA+O6tj2FMTFz5Ar0JCVKoFKnpjW/5K4i
         5oHXZTzHcU3LZphxGa9HvlTw+SaIgIkryxBikI0CBpeZvlSmgJ5FvewHsYCLJwNkIyVY
         FAkYlQCyHqCvfr79zo+eTL43NM1EULsuF8YlvGp1czttqFVxV0Gog4nhRDaQ8PSx6P78
         bnUDAIQmSBckGjamaytOgAaI8ndK/C9soyPrXpVeHbUT3ZIxOQQGfboI6AceYvFIObqA
         Eriw==
X-Forwarded-Encrypted: i=1; AKwUvBxyxWSnwMo2pF6OV/Mgq/P/n8L4KO8lrDLAgdBRg7SA+nhpIvYvtO4B+rae5f/HIR0IFtXMw/j8i+sR@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kcTRh87F1iA8qPhcbZLGAmvz+8CjlKNk+WXXHSbIwc3tJiAg45
	BXcyLY0K/dEuZ1FILXXpzkqnSNSBxAvHL9UcaidTBr3q4Rz6HJUQ7WAi
X-Gm-Gg: AYBFou1q02TJBMic47LVMHanv8KZELuGPigXz7aTFbTVadGOhbCiSVO1Y99ez5v4JZb
	kyse4Xu4J4QqxScamccq0kYFRL+xNzxEvpVfS3253aQLNqPygyUojp5MJP3C8pQFgTkgWPJwmqp
	aOPpGFLDzu80SUWR3HrTi70On7zDW9EfbGUpjtmCy7uxD9VOfT9GfdIoge12Y028lhdSfxKtfXP
	cfqeIrQCGhkv6rsuXWVq4CmRpE9LsVBbJ/bnde+STGoB0euZ1P8LmHPX+S8yHXKfCziCwRw/JhM
	GJLoQLBfKiZ33BaFJwPkIyFOGj26xPNCU4T5aA+q1Gvb3Kg4FWr+lZZi3Cv3LiEXo07v4tCO52P
	ZnA1kdScbzgoVCHdU6p62D2tYO132pU/3biHf33esqS0jsJxD/Tg1Zjh60AcjnYtUu7QK8lM/Cc
	vJvDdZi2PIFh0qRympB6pecJxs4ts/A73scG8vy8PVaFq4HUSZHvYZlku2Buzff+2bFv/bfVdMr
	naIBdWlpmvGAVneXWxW
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr178372826d6.31.1788676861267;
        Sat, 05 Sep 2026 23:41:01 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:4590:6205:75b9:b340])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91043b54cd6sm50856876d6.34.2026.09.05.23.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 23:41:00 -0700 (PDT)
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
In-Reply-To: <20260904112336.38497-1-hemanth.selam@gmail.com>
Date: Sun, 6 Sep 2026 02:40:56 -0400
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 4, 2026, at 7:23 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:

> Correct "reseting" to "resetting", reported by scripts/checkpatch.pl =
using
> the misspelling list in scripts/spelling.txt.  Only touches comments, =
no
> code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>=20
> - *	There are 2 common methods amongst the ColdFure parts for =
reseting
> + *	There are 2 common methods amongst the ColdFure parts for =
resetting

Is there a reason to leave =E2=80=9CColdFure=E2=80=9D as is?

Josh

