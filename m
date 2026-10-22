Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709512;
	b=GaaY+EJqUD74rK8b+Z4jqmeQlvsoagwde4g2U0ypuVZiwoP0R2kF8U3HAdCcXDaIzB6n
	 KdSB9wOC3q4Wy9S+Gp2bnIvU0KdHErydq03TvKCcQjdvvqVDARkd1UmzsKng2zWZEUgTU
	 TiRdDSbGZJ2Ewfm3d7DX8A5f9EdEZDxj+nDmIkjbocGqX51LfZgGKNQGhAB5uc6rcKH3Z
	 CNnipbQUrGlvEAu1I28ApTEo2/WAusK0IIZCttiVKuyT1TydpRB5pUvkb29HhyyWGMH6l
	 byGjpzlvRa66u9vkuPHPYUrIHa5sIY0+TH5lTbaPEefIN9MiQ9yZJFi9c+ejuZW89Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
	b=NB0YGIRKrE8FCygnpmS7EltFPpxptNktuhIuuQpPQeQ1Hi8gy5nO1cQqFURwdnvnTdjn
	 MYhCJLXlL2I/li1tOWzNxnjisQDr8JhRejdFXDe6Wh5Mt29S47NtjEQ00gNAF0ST7sodU
	 WCP6BtMBGS1VV+UoiWfjdctSsoM6e01hVQLdq2AVeEuLQ+h9UejdUMtY53D60ppan7cJ6
	 XTRWzWWh748xMJq1xUgYUs+cpEvEv2WT4X4u19Nv9V0UWF1/LWjcnVRkwiP0woTPbBbMt
	 8VZo58WCqZhOMzwTBPj00E7pL2+jfCdqTZckyrEVSd6S7rn/7yrmZPmPO6G8cubf6+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=acXV3egG;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46C606A319
	for <linux-m68k@vger.kernel.org>; Thu, 22 Oct 2026 22:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB46C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=acXV3egG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso537183eec.0
        for <linux-m68k@vger.kernel.org>; Thu, 22 Oct 2026 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709511; x=1793314311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
        b=acXV3egGoTGYDjhdvrmZk497EKmTNRskbF9WlLcG7GYMYMFF1ksn4VI2y7BZGpMJCZ
         SwrJOiYphQOIuAHhJrkM4WmIKjioss1sLDSUBi72gPDta58g5qXAoWl6R8biJdB8dGvU
         A3vg6/M4WwR7KJRZqikZ4deUJnjrt+Ngt87dL6uJ16ObnnY8RGiKI3Aau6b5HcUaAVd8
         JhmSgl3bNjAaODm64JbQTBHDJdY0zDM3obmTalXqc6cYPRs+rc+YE4tBCyltdg42g1X9
         yg+Kmru7yX8g9EF+eGMF56pXr7WfdyPuJxdHgulU6ykalltNNB7ciJ9cRPVlIXkeGkyb
         aqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709511; x=1793314311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
        b=H3bqZ5caiM3fo0okSAnYcf/gWrigC0dDBocFq5YXF4zF0011nAwThR4kZ91w/mqbLY
         Om2bvNZBhQvX1PEBYOOajyVEiAkXDuyzRym9C0yAPIRn4+mwKtkFJuzYoJiWsXJ+TufW
         rRfyZp3UdQ3v/NZhKaf6cDFZivjdCHIk86bBLt/re6Zu0BO2yRzeKWFd9yxfIjLW0efm
         dBUAumo5luupkti24Fxuevky6KXNEBb7Q5Ix6mHlaqQWa/b8Gctc9MglDmoKWXaVk/Rw
         RJcD2Wht3bIQCIJQrMlooX9dvxF7QjCy8FxfPGc1lO5ckcsHlh8klyBssIJZYoI7MKRv
         SqyA==
X-Forwarded-Encrypted: i=1; AKwUvBykPsFR0F+DI0bEIHYJE1XNcGeFNKVqX7gYNocHsPBUSnZ26ZUaauYMTZQs05OOGUDTXgIczwEn1wrI@vger.kernel.org
X-Gm-Message-State: AFq9FYIIyAN6GVo4Lm5w9QPXe0sotAys45s+3njP8p48VBqt6JNMpfX+
	a7eCp4oppGnh1t2uB5Hwmo7HsLuIaqXrlgmFe6zCjP5PGU0ga2oI7+92
X-Gm-Gg: AYBFou3qCSh5xHGDflIBmamqwvNn/l0X8ak96USDWCoVKKG0R2TpLucGtBb9TN1wxNY
	TdZtTXgyfjXpNyxO8cuwZ7PNFVyDiL1341Yr5ZgirqSUnsmbFovNP2JqEgPVFI2Huov8SI8O4rX
	BQCe8uQ78rnWIJknjlrKtkT+sOFG4I9eYBR5ydUh0c6pn/NKEBLNL/IAmQvVSlRy2h3Cy7/0+vR
	B44V2SGlDeikG0l7v/zjw2Y3WwBecBpBaCm8olfeUMMI75Utg9c8tBRFIqA8Y1hzv62JFh9UNI9
	4Q1+w9f9V27hU/Ivb+XTmLJNWaocVnnnQ5/k9ZDxjZ/tLnE92O9heuKgNu6CkWGrdkDFHlyryG6
	6DVKG66zZhByi71mrkkT+55FEsqH9aldMUnGrddshiMudmeGThunzo8PZxcNxOObtl5ubYPNysF
	7oU3M5TFj5Ht9scS4XiYCcarYsFSDpd9p6eRKu59EYxu4ZD6qcLsg280pRVwHDjm6bhbo49iWcZ
	UWnUF/UC8GPRFCeSb+3zDxLk1JJSJGqnq7GNLrRvpmLQZgpzEse1eHk+LiRrkvOW7VZ8aL0KFiT
	kbmeKvch0VrUrDJUxvpzuQ==
X-Received: by 2002:a05:7300:ae21:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-369d90e3646mr708317eec.1.1792709510886;
        Thu, 22 Oct 2026 15:51:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm1071997eec.17.2026.10.22.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:51:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:51:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, 
	Miro Kropacek <miro.kropacek@gmail.com>, linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
Message-ID: <atqTLxkEusWSS-wf@google.com>
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com>
 <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>

On Wed, Oct 21, 2026 at 09:32:00AM +0200, Geert Uytterhoeven wrote:
> On Wed, 21 Oct 2026 at 04:51, Michael Schmitz <schmitzmic@gmail.com> wrote:
> > Am 21.10.2026 um 15:23 schrieb Miro Kropacek:
> > > Kernels are built with -funsigned-char since version 6.2, resulting in
> > > the signed 8-bit position deltas reported by the IKBD being
> > > misinterpreted as unsigned.
> > >
> > > The hook is handed a raw IKBD packet, so take it as a byte stream and
> > > apply the sign to the two displacement values alone.
> > >
> > > Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> > > Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> > > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> > > Cc: linux-input <linux-input@vger.kernel.org>
> > > ---
> > >
> > > Changes in v5:
> > >
> > > - take the packet as u8 * and cast only the two displacement values,
> > >   as suggested; this drops the call-site cast v4 needed, and with it
> > >   the -Wpointer-sign warning
> > > - add the types include atarikb.h now relies on
> > >
> > > The same cast of the two displacement values was tested on an Atari
> > > Falcon030 with CT60 in v1 of this patch; v5 differs from it only in the
> > > type of the hook argument.
> > >
> > > Michael's Reviewed-by from v3 is dropped, as the approach has changed
> > > twice since.
> >
> > Dmitry's reasoning makes sense to me, so we're back on v1 with no change
> > in functionality.
> 
> If it's just a byte stream, one might not bother doing s/char/u8/, as both
> are the same type anyway... and then we're really back at v1.

I'd prefer to have u8 at least in input.

> 
> > Looks good to me, feel free to add my Reviewed-by if it helps get this
> > merged.
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> for the arch/m68k files:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Could you please re-post v1? Can;t seem to find it.

Thanks.

-- 
Dmitry
