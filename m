Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C87F9
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819684; cv=none; b=nXvBoYHmLDbucm8Vq5PX/gSl2SsU1X9gd56zd7GmpzS4SdxXm61J6b0lrb0zSNB1jnWEIo2np/WgPGohgUOYG5Uek0E1cAMqfw/nXcDhZD2noMag+5HZ7iFrHZY4u27l9eyxS1xkdvcixP4Zb7MpDW/0mU0FNYbpPdB8g8MB2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819684; c=relaxed/simple;
	bh=5WFslk9cKp7TxAWdtb3VjXIIKd+30n7Biu+enBnWfLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC39AdvgbwBq+OEjDZ0cjdD5jg8MgHeb53rnPuZccebf2mV9RVs3HaAt6ZeJas90UajgEKbR5p3wPf4wgqsdCHfzZqrhd3wA2nX3GkUggf7IKrf45UGnUyehoac/+HJDozVgEJbJZNIPhxbm7aK15F7dYt/tCrwUGvsn+smLbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kazik.de; spf=pass smtp.mailfrom=kazik.de; dkim=pass (1024-bit key) header.d=kazik.de header.i=@kazik.de header.b=TpxXXms9; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kazik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kazik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kazik.de header.i=@kazik.de header.b="TpxXXms9"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-610db3f3f90so1015220eaf.2
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kazik.de; s=google; t=1749819681; x=1750424481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WFslk9cKp7TxAWdtb3VjXIIKd+30n7Biu+enBnWfLY=;
        b=TpxXXms9XcRj+qiorOHVdmxL2fugXLBJDKI0c9LdU2rtBvC+JY6Ag2xzZm/lXt0TN2
         QDefN9IFnCB2r9XNXkjT5zI90zM55G+oqYoi3l7uwwQ6OkHAdKXdi0ZqQc7zb70smOfO
         D3Q75t5gc5PpkITCrzRNJWVbemh+xJzd6uMeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819681; x=1750424481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WFslk9cKp7TxAWdtb3VjXIIKd+30n7Biu+enBnWfLY=;
        b=EbJhEBCEWgKYs5fKBPlK1BbxKJumMvLdW24KnhjjIn6h+yLJXJbQbvPfchxJQCkVnG
         IQYjplAIFtGa6B+bjR9IzNYLv/4Pjv7vlFfxvhntDLisQTX8DL8fwp7IenaxQ1ykURPC
         rMJ95SEOVgWj/xG/VixcYuOotIQgr3xnWHcoiSc0LcnuZqg9bhlTswBX1wuMqNVQTK/F
         rVTK3Xv4bGtJ44sdyfx3SeDx1MEnrUvkMGlbQe5f7sZdyQWWwSHjkVMthfd3kL9oQb0x
         IUgPtQaH+Kw1drYAEO82O0naUujaaqYfMrpZ8jabKJZhJcmgKPLeiXa2bd9wIwwn3ucT
         qc3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyl2gHguIClnIY/v/NFXDp9cq5CThPXoQ0i+PTbziQgofMHc1fVghXE3f1NgQRVSOP0girGp/mAnFS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRu/vDnk9/FN62+7ZGs3cmHsvUuWYvGsFAqJbcsKvQQ93+Y7h3
	+a3tAGa5CK2D6Y2KEH5AAHy3YlwXodxonneot1xX2dzMX1TUXmQShJ0Ku8R3tZhKmANRKtz/Sqx
	Og4oUZbgpppAx8ui6siPPNX3UU8TlRbwleaztIeIq
X-Gm-Gg: ASbGnctXK8hkM/yx/AzFVHejv0DPbUn7Bz+TgV30z9AHvN0huw31Enwty1vc1WtSsLU
	CyiN7hRjfEcqVOZoCZPG2B3Xlupp3fEIJ4eR14yq2okzr2trF6CyVDJMMQtTN4SFtYIugClT4Fv
	JPH8LgWH89ph0Bmol4FOqIKqJ8KWazTzOXqw1z56tus7EhL9tpAPoFsQ1JUfGEXQj7F3buLFlCQ
	SM9
X-Google-Smtp-Source: AGHT+IGn1+ETT+zm88pwAhw5+VGefPJ13yC3WqC+eSWuCkiLlWav/YH14qslkoNZ1avh0V665XG8lm0WtbTCunS4KaM=
X-Received: by 2002:a05:6870:1609:b0:2bc:7e72:2110 with SMTP id
 586e51a60fabf-2ead4f10254mr1663010fac.13.1749819681083; Fri, 13 Jun 2025
 06:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com> <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
In-Reply-To: <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
From: ALeX Kazik <alex@kazik.de>
Date: Fri, 13 Jun 2025 15:01:09 +0200
X-Gm-Features: AX0GCFtl_8iAs2sM8DB1r9zdef5A_jouzh1bf72V9WkcUfDMQxayo_BTNZPfEHU
Message-ID: <CAFFuhJor0woLg7kK1OZTt0HG3=DT8f=VL6M_bVzJeyF2vD8y9Q@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm only reading here because I installed debian on my Amiga a long
time ago, and just for fun.

And I think that the people who keep this running should be able to
decide the future.
But that is only my opinion.

Alex.
