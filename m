Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE143C26
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Apr 2025 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745885076; cv=none; b=hVp1lrgz1M6QdBKjNLHVdTKdf9mE4eHp4BdNLX7bzTAAXmQ14mHCY8Scknj0LmkgID14Vmy9bIqCuEnjkKTDEWbZXorLE0T+D2PckeJfiXv3EBTlRN41pGJTWwsXOTDphFEo1gyfXntluldwlP0Rw8YZmdwRIhRAVAopLCv4vFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745885076; c=relaxed/simple;
	bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IafrKK3y+G1smqwUmIEtJp9FPlOZH3ECjMaQjDlUNrzVHBq99+ryIMTP7WfS5GNKPGblntOyLkibuhQAV0OsUpa0eL1weNnfWzn3GSDNCcffRgdjXy0Xo1hrzBydQ0+L7n3h8mMgDcxyDdU84E9/V6f4SPVlTdboRSEFSLRRtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=iu03hI/c; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="iu03hI/c"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5005907b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Apr 2025 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745885073; x=1746489873; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
        b=iu03hI/cdSLWjXa2uqfnQNxVSeZnPOe7APVdhc7rfkO1yzpSKAoS1M36qOuRxth7P9
         y6Knc2zaCQPTHpvLYEUVuW/pqS9PLPlmP7+YvpuQRc233lFzOrMHyKkf7BAL4NJRC/TB
         gAk4hAn8ZKW14vJLpfr60GbwtItIGvWmzRxjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745885073; x=1746489873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
        b=KME0h4W9wANa4GFwNevZVdKzJ+NjUwSMhENUACsHTec+Tx5hHnadT3dLR3zND3Ux/Y
         S6xVYJxfoMeqYBcfEbuYpt2JqRJIQzy9LNqW4S5JOnmA8JGXV9M38qVFFkFtFuGuzHl4
         uEbctdp2zP5AXxS7Qupdp+4QEATwV1+NFcjWXz3Oa/ry7rNeRuGSgpTb1uEOr4AZ0lVM
         ylerMO8NuzHBr4DyS4oDiQ3aNw+AqUqK3GtTf32KKiM8kamFvR0f8bOMeIKf40Wxfoth
         ojjUnq+TzKGj2f2/39B38j0qUTHyUSz0GvdCcTBubZOsWmqhpTkFqtVnP9t4s7VCNuzV
         B6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWjw0xsMeTBnR1k9iM1yN3mbDgCl4FTuHGVw0cJnXYZoS9Qyf6DqaGsDEXk7ajYiTVLCDfldnI/cra5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwmgGUamzrNUUls5zdImzsdvNPgjgjPTS3Dzf3122c/suZli+VJ
	5DpCozpwKE3Fqlc/U/m+yLeoXneynBUdkPyd46Dk7GDl2w33aS8BdhMPC5rA/MiNcR1+HswVz5K
	SYSl59+5VjKSUOxTGtwSf6H1icxcHrW8O7BMJrA==
X-Gm-Gg: ASbGncvo8ESgzRCP/w2Mva6Q648MXZQeQUtM5XvtkAYNp9IeG/RM0JrNr+4PfCfVNsF
	xT4xuD6wAgAiki17sfoOEfVqpmYfsUqWiyt2h7Tbt7G4J9uCHoZd2RQ00KcRXqmYBEkdJ4ngjgV
	qdN3SnGjC/q+39xp0phsQ5B3SWiCdO2d6UZUGYmDCBvi+AuLgHemirP3eR
X-Google-Smtp-Source: AGHT+IHODQs6hlSHS3ey+DezbNAm7mdXVwvvBJJmUkxpQmUDI1R7g/QJMgfhaFo+GAPgW2tFTHfPxuVQXs6avEnvSMo=
X-Received: by 2002:a17:90b:2b86:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-30a23dc1e01mr944498a91.4.1745885072890; Mon, 28 Apr 2025
 17:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
In-Reply-To: <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 29 Apr 2025 09:04:22 +0900
X-Gm-Features: ATxdqUHQKTGOMSOv8SkE055vDmiDt6du5-89tna8BU1UHWG1e9Uo5AjH1ewooDM
Message-ID: <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> I notice that some other architectures (arm and powerpc) have version
> checks on gcc or ld in the config. Do you know if there is any version
> limitations for m68k here?

I'm not sure about that. I'll try to work out why they have the checks
and see if that affects m68k too.
I'm using GCC13 so probably new enough that most things work.

Cheers,

Daniel
