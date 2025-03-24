Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC125DAF6
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807455; cv=none; b=kTLCrotA2AMPijUpA52GWOQhCsNagY3TkLFLIi4duy8AdC1U09iP6YlYFISxB6e8wa/GX1Yb7hHLNqJoZo8xDQag8sIciV7/kmVi11ryHvJIjN7NryaPe9xvILG2DMGOpNdD/0+Sc0U1YyGhh8wqLo0lS4bnUj/Y2xA+ZTefQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807455; c=relaxed/simple;
	bh=UgBPHe1XQGl5FtIyYB4FXJdalGDGR5q7sWHl2kmxQMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB60F7wbZuFhD/AeMor+PqNCC32CEq4+hDmi96z0YpCjjZov8d1tIaqpDDshEMhFFaWvfMIGHrXU5bjqfn3hSRx22Y0TzUMIPbA85HH8htTMbvbPQizhV1JpjX78Z8fX/NIKOIrvQyMQAAH0EKJSxDA4vLX8ETQNcByy7WU21Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CConoFNg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CConoFNg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso25565995e9.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742807452; x=1743412252; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpWQimo+8FOwWH1KlD57/iYLoAt1JCWWGhkn5vZgVMI=;
        b=CConoFNg5W7HFb0e1d1llkEPvnf3rZM6UxNl3MsWrwl6EJU7PzkPfkIO9JRUbvlmyS
         WiGQrRKfTe4BCB90CjWaskD+MMODuAP0PGrMsWPMFdsdVn5eNT0cKPDC7Qv9daYCs5a+
         G1KAZ3Ko7wbaddHjaTxDPfF7++HsuQ54T0EFH+m/h299C5O1aMBLzIP6lGbJydBMqwup
         0j4lP6HW39RNsSIwiXtLcoSMvtFpdEdYMJr9OXUKgeDlL4+pPE3JmA5qtupCTon48EQ9
         Bd9QnppYx+kPbrfAM0LSIYRBbummv2OU9lA5iGA0xTShYTeMHColR2+y/3qLf7tMnRhS
         iRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742807452; x=1743412252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpWQimo+8FOwWH1KlD57/iYLoAt1JCWWGhkn5vZgVMI=;
        b=K/lh9xPB2MD5/DxW1oanBdx/wjO9BcsSYHnQvR4AvoHfPPqdqnDSqGgmRYfhnMmpfF
         folCOVt8CHensXWVEcjeWHc7PT1hmKMjiHvDLYWEEZS0AJpJXWZ+Bw2w/96xGGtZmh++
         Is9AH+1dReplzPwY7i7/UalojuFC1ppvPpwx/o1N0u9hTmk3nfxgf19NSBtup8vYe+eS
         /jR12xZy1yUIWg/AuLa7jhULvcLhoY5DiiILPi7gImTji7tqOm/YHgTpIQIKfJim8jx6
         yTXumBF//B/mNRuMUi7oy5fU4r+/VVwaKtxdXX8Li37GqnXkcEVQesqz7rPE7wN9+ep/
         HrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJVlDVM8AahEHM7blXhhsbQ+GEKyRqkdpMp2I+nVkH3t3TIDuwPDlgaVI8GjXzgjs2XLCBT+06orPu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxrE+staltH6ol8bySd0Gm57/kOrTkWb7KNzX+45Sm2swlcpFvS
	Uj3OHC6RelWTWENtTGp3ePTAYFjrLtv3jciCMz6TYXj/MoB7alF1
X-Gm-Gg: ASbGncsLzS2oCh73rSt9twfQ/+BeIwf1wdnIlqEqe0L0fc+A4Cne2ajWO0jLrWaBq4L
	1yONBuFYMtQl0vLgz+4kY8zunmpuJt8Je55lCu5BUMtgQ2P2YUhFNBVBs2cWKrvhPRfB5OGihcI
	LusmM0FDl2+9Wecqt+BwKwezEp9uJ4p0rxErDfBTYS1+KqpLyzqZFBlB3gD7HC2cdZ94E60rOv2
	GHXGubU2TUGnCD7caceEPwyQdRt5eFhWX0DuQEkTqc0LXSo+xhDh8lKQ9EmoYqhfuX9GZNoATns
	6NJwBfSQMPwvynQmKZQeBE7NbQZDrYs2cUgMidQEZhU=
X-Google-Smtp-Source: AGHT+IHTzWEhQr9+0PhtSYCzvYjG0/qEljNMdLesBkRG0POOjNjgw6tTXj8rYMPQHE/SAVtvUdpLrA==
X-Received: by 2002:a05:600c:1913:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43d509f633dmr105837185e9.13.1742807451837;
        Mon, 24 Mar 2025 02:10:51 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fceafb7sm116682435e9.1.2025.03.24.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:10:51 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:10:50 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 2/3] amiga: cslab ata support
Message-ID: <Z+EhmiMWIMGqlXXP@amaterasu.local>
References: <20250321151416.338756-1-p.pisati@gmail.com>
 <20250321151416.338756-3-p.pisati@gmail.com>
 <CAMuHMdU0yDSXoeDoK0yUrJ-cD_4BChEXcvteJW5Ra6afKzciMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0yDSXoeDoK0yUrJ-cD_4BChEXcvteJW5Ra6afKzciMQ@mail.gmail.com>

On Mon, Mar 24, 2025 at 09:17:57AM +0100, Geert Uytterhoeven wrote:

> I started working on Zorro MFD a long time ago, but never finished...
> https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd

Uhm, that could be useful for this multi-device board, thanks!

> > +       /* Manually bind to all boards */
> > +       while ((z = zorro_find_device(ZORRO_PROD_CSLAB_WARP_CTRL, z))) {
> > +               static struct zorro_device_id cswarp_ent = {
> > +                       ZORRO_PROD_CSLAB_WARP_CTRL, 0
> > +               };
> > +
> > +               pata_cswarp_probe(z, &cswarp_ent);
> 
> This looks very hackish to me...
> I guess it blows up when trying to unbind either the zorro8390 or
> cswarp driver?

Yes, this was clearly wrong.
 
> >  157c  Information
> >         6400  ISDN Engine I [ISDN Interface]
> >  2017  Vortex
> > diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_ids.h
> > index 0be1fb0c3915..5736d2bf0295 100644
> > --- a/include/uapi/linux/zorro_ids.h
> > +++ b/include/uapi/linux/zorro_ids.h
> > @@ -455,6 +455,12 @@
> >  #define ZORRO_PROD_CSLAB_WARP_CTRL                             ZORRO_ID(CSLAB, 0x65, 0)
> >  #define ZORRO_PROD_CSLAB_WARP_XROM                             ZORRO_ID(CSLAB, 0x66, 1)
> >
> > +#define ZORRO_MANUF_CSLAB                   0x1400
> > +#define ZORRO_PROD_CSLAB_WARP_DDR3          ZORRO_ID(CSLAB, 0x3c, 0)
> > +#define ZORRO_PROD_CSLAB_WARP_VRAM          ZORRO_ID(CSLAB, 0x64, 0)
> > +#define ZORRO_PROD_CSLAB_WARP_CTRL          ZORRO_ID(CSLAB, 0x65, 0)
> > +#define ZORRO_PROD_CSLAB_WARP_XROM          ZORRO_ID(CSLAB, 0x66, 1)
> > +
> 
> This does not belong in this patch, and adds duplicates?

After submitting i noticed the duplication... anyhow, these ids changes are not
necessary for this submission and i'll remove them in v2.
-- 
bye,
p.
