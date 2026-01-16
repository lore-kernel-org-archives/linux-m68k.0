Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2772374180
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562704; cv=none; b=MLfINz3YH5a/caRmsLcpmPAFVwyw6rHmXldWuW8jpsaGAc9wD7FRQ+FeGtyS8GuTpmgs7pN4O0cZ9C/wV7aCvlj8OmDRp07AfUOj1Iz4AaDbJeJxUzx6HWtvviemGJHMChniILRZWg3eMsLH2PkDQJiGJNmkhTeC+ZjjT2jYInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562704; c=relaxed/simple;
	bh=/g6UosszliNH3H0aH8WNsqBAAcCh2Bdc6HOnAKzgUDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdMgeR9uDvdj16EQeswFEJXCYLnDg/EEeYU6o6o+9ePb1EqscKiZ9/2vxNJTgI2Gko/lpcCZohN+PXFPdEubfT8lh/lVMwvhEdTs7s3Z7QgSMVbNjaBW+WyNl1MGziGF9dyA56/fV9SwcN/3RRS1MB9OzYVj9Zf5OHyNes/k7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=iZknOGRO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="iZknOGRO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1225462a91.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 03:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1768562699; x=1769167499; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/g6UosszliNH3H0aH8WNsqBAAcCh2Bdc6HOnAKzgUDQ=;
        b=iZknOGROEPSdDCwVGFSw4jm474aq/lOtSa5DyRmu6ZfQ+H4jWPwn4gGlucMMaAHdvB
         6zXRMHldZX4y7MzN9UxDPg2F4D2DqmaQ4ly0MN+8trdqFu2fSzWinM7rnJZH4bgtRs8e
         qH+VACWgLVJJVwcDbJ5K7+hDYmSdDbJtmzX8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768562699; x=1769167499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g6UosszliNH3H0aH8WNsqBAAcCh2Bdc6HOnAKzgUDQ=;
        b=Hqoz3ZP9aGxJ3yuxdCIDPGHz3/Vy1ViPV2931U+bvgGFLRLuh/r4V9E7u6SFbxWzKe
         UbVwFTNbUXSWlnH5lbSoQx3SyUuCfe7Wxhxh/THJfDfNmXISofE/tRe0NH6rwjZcWb/d
         t0aqVmd2lJg8VsBx7NbCKGqrWCzu0l0sgT0TSzPcjn6R/1Ry6uJ01/Hqfmi56KpBcXuH
         r9f4t7owUYXpMeIhPKe4h14bAkrMbmIRKSuHIWypYpOQ2ZiB3jivA01Eom4fQAykPmbR
         NKS5Eq7KT0On40G0cOYvHlcvNX09Nmjru0DMsxFQT5JJRq2Y976+wwVwIPAwQDuq/Khi
         6x9w==
X-Forwarded-Encrypted: i=1; AJvYcCWroxor85yMPuJkPyKScdegEjzKCsEAdvn9CvwPrILBrMxypy5hla34t9jKZ2fT+jxtD4xmmXRTMpno@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwncUXZ2en6h9iQW4l1E+LD940P3mgNqiMiaNzMeR6aTHMrUFes
	iVk7iSmXroGEvp1Y/rE/tSWQyxO1tnk5XnInQDrIGjOxltYDIT/0Phb24Dv0Yr5ssqgFvEO1VBH
	CKJC1dNT/DCJfOlxUu0IS5T36Txyt9jzagtAtu5uLOw==
X-Gm-Gg: AY/fxX4kXyqt2mzripB3xu+Xdkt0SmiYIe5hkfZPjGlHEP8Ow+IxVyym2b+SpBibUYq
	TR/0Jep4+1iKhDojhFsS+EnMzBVNbTvOHmebQ+iDowxJ4lXkIJFLjWvlGSeeIjpALtYNUFUE2QA
	d/JRlrDTNw84A8ZpRKEfwfKMF7Hwi2NSvP5Eu7UbhCfpnPGIUHHv1YY28VsJo1EJFOmmNvOs+qn
	km06swhyj29jQ2Tl23S7909JAtLxyN5e6ej0Tn9FBJomDAdc8KdStJDKzyWZcvY9WbphYUx
X-Received: by 2002:a17:90b:56cc:b0:34c:ab9b:837c with SMTP id
 98e67ed59e1d1-35267632a0emr5685222a91.0.1768562698932; Fri, 16 Jan 2026
 03:24:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213120401.3992567-1-daniel@thingy.jp> <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
 <5c2730c2-d969-44af-85f9-4d57c0ad387d@linux-m68k.org>
In-Reply-To: <5c2730c2-d969-44af-85f9-4d57c0ad387d@linux-m68k.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 16 Jan 2026 20:24:47 +0900
X-Gm-Features: AZwV_QiMSjIHks-Z-MHm9kU1Our0kWnxStQ_42b-Pqelgu4Y790lJpUTJ-jvuSk
Message-ID: <CAFr9PXnDirnnVa_hdt=23p6psqAs6idn=txx-Dn8EU1ULGSMjg@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Fri, 16 Jan 2026 at 20:03, Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> I'll add this to the m68knommu git tree, for-next branch.
>
> Thanks
> Greg

Thanks!
