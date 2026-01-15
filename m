Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC83B8BC2
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490513; cv=none; b=rY6BVvoibBxiblC9n/jo8GBux0IxT53nQ+Fr9wi+KybcrJ7fNUUS+ODSL+8OS5w/FcDXg+ZU4voibkk8I9n6w2WHRzlIaYBTu2KC8+MXdERQG7vh4pKjxkPlhlzTSNwdeiUtpfE9zFSw7aL1tnP21eydEzOd5vfm65Sm8QTmENU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490513; c=relaxed/simple;
	bh=3mrmeybuzh9PgQXyTEyKUo1q9SHk4JU+LnlVDAEkQ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnwzwENS/EMwG14rSWWukGxQe5fmr5Ox8lI07LrzoxbvFcgn2L5gl4XGqjDS30NWUVLhn+hUuTWtit0lb01KjVO05Q0nnqCukjI4BrRbdMnmo5qU0up1qQ/5vl40Yk0oLNfGyNHKk+6rgYP+U5G72d6BI4wS85dEYPid/pNeNNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSIycc1F; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSIycc1F"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c2af7d09533so700162a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 07:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490502; x=1769095302; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFSOPl7QH14MMJkmhVI069FeYyKLf5eLmECuhHyuPZw=;
        b=aSIycc1Fr9eGfqKbBruNVk0nZ7XH6i4bb8akqqdL6nVdFFyuQTaY6jwoGfYb81Gpjt
         rAWPWFnLYwpHjyIp3M1hj9/TrxQsDn4dODlR/vCWvk73cHZr9Iszlv1IAVMCzQNd9VLt
         ZgVxOz31HrceWWb0WwAgTUYAafK0HRDJMz0ZQJETfibxeeMKjiO4k0I88GdZIHD/M7cC
         ir7kxSki5/26L14KwiFYQQcXf/rZAHK59o303jhnoiPm0Ks1SSCI5tgybDV2Zg8hcy/T
         rxYtEraTzVhhYfgSYYwbzodKerN2TStXEmzJ22a3MFisCgb6YF9/163Q2MBmr7IKZLLH
         nFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490502; x=1769095302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFSOPl7QH14MMJkmhVI069FeYyKLf5eLmECuhHyuPZw=;
        b=XzoX7zn6G8zcwdgwD72a2XL3+nC7MPtOzpNQT7WS/we2gaQ2C4bZehPAWzXciXS7W4
         kygLXk6TVrNfLRhqw3v/jUu1TjoUKw8vbnpxml7ng1E/dPAp/gpm2Sg9BFbJq+bmiyNx
         6W6MMP7BJhjgOJEX+TKJECTHRxbQvPvFn0Z1Gcf166FXdn9RQ4ygTsreCKzKQB2E5EsF
         0UJHhslyNv+IhMsacATQOl/HjPlA9L4cZSRWBaQF+XSGQR8VdkvWVZa5x6/wPthnoF6G
         RQONke52tAzn5at5ggOC1KXk+Z5NvxcoNTFSE/ZqlaWXqu0RgNQvJzPMK8h8t/aqDXke
         vYbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Xu6ZmINPFR38mGiZQ3E4JF4FCoizt3yQHeCYumxUdeEofMtYlcVn0fWEk/Gg/VVpaPz4KQXMmPNl@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyZWbU/oYDpbjVpqW//YC0ghvTVc42JG9Huu5WdccR/6k3+1IBE
	xf1bWeDn5tz+JFZpPHtDPU5mOLJ9VIXWvq9VHNI8EvOnrFAhV19V5opu
X-Gm-Gg: AY/fxX7zNejkBsTncdUhVjkLZfGhbNb+/UZJaqKKa4zirrl/UFU07KFGZCSzoRDkQCA
	2Cd5xjuh39KGG878nYUifG8RkGLBYiO6KNITaykAcfTCuoHLyTYLnePYyAlJsqgmPbTegjhp/1R
	D7P2zhJs/a3F8E13zgkXpfKNASHmXWkwEikPndL0bGbXcWkq8NJaGfcxtEQq4TVjP6ecUZARTmS
	IwHjpQ3RC1xwN2BvoAz1QDU9TQmJ0/U0DUA1QEAF6XUqdW4+ez2xcyNQbhcSu4axfncCZJWTEqG
	0Ffm4goIVW8JKqzvMw2M2+Bxcp9ifA0QLt6p6VzAh4IZBF4wYXu9kfentO0YDBYoZ2ISPzThkU1
	lRFnoOsjed/rILqqvSFt6mcplmJxWwUEfcibb0/BbVkXlo0XXXFcMGb0LfKTv7i1eCcAqgZQBkJ
	tw3suEoqYZ+S/McPMNzq2pqriZ
X-Received: by 2002:a17:90b:180d:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-3510b145a4dmr4806914a91.28.1768490501476;
        Thu, 15 Jan 2026 07:21:41 -0800 (PST)
Received: from google.com ([2402:7500:568:57ed:9f73:35b6:5a3b:786e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678ef77fsm2307285a91.17.2026.01.15.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:21:40 -0800 (PST)
Date: Thu, 15 Jan 2026 23:21:36 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, sre@kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] power: reset: Add QEMU virt-ctrl driver
Message-ID: <aWkGAEEpTBn5Fch8@google.com>
References: <20260112182258.1851769-1-visitorckw@gmail.com>
 <20260112182258.1851769-2-visitorckw@gmail.com>
 <CAFr9PXn9nzw=kmWqv_ZPZshhGuh0iAW5b=Csygt6WZOnmd2tig@mail.gmail.com>
 <aWiGCY4aEF5dZOqY@google.com>
 <CAFr9PXn66L8FxEydCrRDR=_pVtspsFO9hOvZuWNtEB5z=9Ds+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXn66L8FxEydCrRDR=_pVtspsFO9hOvZuWNtEB5z=9Ds+Q@mail.gmail.com>

Hi Daniel,

On Thu, Jan 15, 2026 at 10:29:29PM +0900, Daniel Palmer wrote:
> Hi Kuan-Wei,
> 
> On Thu, 15 Jan 2026 at 15:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> 
> > > FWIW: I have a driver for this in my "m68k with devicetree" tree. As
> > > far as I could tell the virt_ctrl thing in QEMU might get more
> > > features aside from power control.
> > > So I made it a misc device instead.
> >
> > Thanks for the note.
> > Just out of curious, are there currently specific plans to add
> > non-power features to virt_ctrl?
> 
> The docs here suggest that power control is the only currently
> implemented feature but doesn't have to be the only feature:
> https://github.com/qemu/qemu/blob/master/docs/specs/virt-ctlr.rst
> 
> > If new features are added, shouldn't they be exposed via separate
> > drivers in their respective subsystems, rather than consolidating
> > everything into a misc driver?
> 
> I guess if it did get new features maybe it'd be a multifunction
> device? Since nothing except power control has ever actually been
> implemented, maybe the way you have it right now makes the most sense.
> 
I agree that migrating to an MFD architecture would be the right move
if/when qemu implements additional features. For now, I will stick to
the current approach in drivers/power/reset as it fits the existing
functionality best.

Thanks again for your feedback.

Regards,
Kuan-Wei
