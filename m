Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9939E6FB
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483786; cv=none; b=mIfULoa6tEHnOVFX+UuVjt6agqaejfA7W8/EJlIflMvUkjRutrc0Y7Bju6RivgXhT/cSs2FBXxBTxacTzX+7oaffo3fInsnN/w7ZtY5ODN3oDEeJKm1DnB0l0ociPIejSHovFfML/JdnkHj4GCWZkL9D592ufl7HNTjy4T66bdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483786; c=relaxed/simple;
	bh=irwPV2MgNHEQZ3kOMZ6puI5824+S4bl8VRfHr1Gcwhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzrzmJBBtVdJYGhG0kqOaggEyL0niDeJYbrU10GTJT3Z+EN80HitM43UUasgvWD4ka6iSRFtcXI4r699+bIT6aN2X92v8iJjcZxGh7zZ0qWCPLrPe/EkKpG2repM7EdC7sd2VN+iVirfcdU0Er8Chab2I9C9CHg/OePm1JgHQUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=ghA4mb5P; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ghA4mb5P"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso124510966b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 05:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1768483783; x=1769088583; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=irwPV2MgNHEQZ3kOMZ6puI5824+S4bl8VRfHr1Gcwhw=;
        b=ghA4mb5PPR7PpGT7c4D4/y0qq0mqVZAWRaZjoceAnyjubwJW1Rltq7fk7BuSZ0ckmb
         4cmHlHrW5qdMbtN5VN+Iw8fpKghrztnyQ83ES3jPnBiOnUYlNE5aUBEorLltE7CeisYh
         PgCKdAk2jT7RVaPWesx33P9Ns9d9/uVZ+ua5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483783; x=1769088583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irwPV2MgNHEQZ3kOMZ6puI5824+S4bl8VRfHr1Gcwhw=;
        b=GYvgVIPKgjKpooXCl28uH25cbbjyPWzPxHdlfBetiTkxTLIZnYtDrHZRiCOA6KVBfR
         M7mU23Q0a//2klgz1JRnfGJAFAqLz3tWdj5Lw6bsg0DPm7feIsLEnZFit418oGIuToxt
         t3RW4EQuFtpcoki0XWOCGHyVQPhckD4fn60HKl5lr7JVfRbdp/0cMnvMj85rloWNd6WN
         lK8rb3x3soWuIaEFeCDF8aWV80x/Z0ayelD7VrwA5qoUqCEhFY4HbRXIia4RTItSsAok
         0TSOo38XE30dX4UdNjHSaz52ooTzzAgHdpZyN9NgDr6E/8bM2GAxY8vRPss893gi9bCk
         ELuA==
X-Forwarded-Encrypted: i=1; AJvYcCU+cLZfdVQnZRD2Rl/kERYGvYbAv2ji4tnUKHtLc89wBXgKP+YrPZ/h78dSI2viCVXjHbDGWQcQiyyo@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwDd9j6ZG1ObAo+6co5IMzx3l+rF8QoTfhrUhyYaoz4xNvZ1omx
	dmh/ZX79paiKBVNH3WLVStfIRY2+MaRKLYcuDIsXquBc71SUVPhNfTn5fXRziOfQXgNN7V3vDmi
	Tta8Q7hPNKmfJvWhP/6B7M1OiTcxrnAID/+knUNiZ/w==
X-Gm-Gg: AY/fxX7ESJuK2id4CHcF1oK1nAEnni3u6QY6vPn5142HUuzf3SpKQmJ2YxYGislIEUD
	5tz+4qny0AQAY1JSkSbnTA7t77tXTZFwajx633guZkhftjuEbqeoGenPg39hnxYaSpy1VoHl3fj
	wbcIsYfi0Mpxn8a19rNWRJCV8nhfgGhtMgE+w38cBYmudNoe4AiqwqsLJLIUd3LNpby7A4YAJ/5
	XZB5RUa4wBV74x6Y9M/1N63vRksXiGb3UFpwSoS+g2gSwWo0YYwit1aqyGDIOYHPP8GPJOE
X-Received: by 2002:a17:907:1c26:b0:b83:e7e:372b with SMTP id
 a640c23a62f3a-b8761278c8bmr521627466b.44.1768483782468; Thu, 15 Jan 2026
 05:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112182258.1851769-1-visitorckw@gmail.com>
 <20260112182258.1851769-2-visitorckw@gmail.com> <CAFr9PXn9nzw=kmWqv_ZPZshhGuh0iAW5b=Csygt6WZOnmd2tig@mail.gmail.com>
 <aWiGCY4aEF5dZOqY@google.com>
In-Reply-To: <aWiGCY4aEF5dZOqY@google.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 15 Jan 2026 22:29:29 +0900
X-Gm-Features: AZwV_Qg63fOmGyWRiTETksr3IGtchRQvoevgze3Vmdxev9TfyY3aF-ZkirlrK-w
Message-ID: <CAFr9PXn66L8FxEydCrRDR=_pVtspsFO9hOvZuWNtEB5z=9Ds+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] power: reset: Add QEMU virt-ctrl driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, sre@kernel.org, jserv@ccns.ncku.edu.tw, 
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Thu, 15 Jan 2026 at 15:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> > FWIW: I have a driver for this in my "m68k with devicetree" tree. As
> > far as I could tell the virt_ctrl thing in QEMU might get more
> > features aside from power control.
> > So I made it a misc device instead.
>
> Thanks for the note.
> Just out of curious, are there currently specific plans to add
> non-power features to virt_ctrl?

The docs here suggest that power control is the only currently
implemented feature but doesn't have to be the only feature:
https://github.com/qemu/qemu/blob/master/docs/specs/virt-ctlr.rst

> If new features are added, shouldn't they be exposed via separate
> drivers in their respective subsystems, rather than consolidating
> everything into a misc driver?

I guess if it did get new features maybe it'd be a multifunction
device? Since nothing except power control has ever actually been
implemented, maybe the way you have it right now makes the most sense.

Thanks,

Daniel
