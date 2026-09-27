Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326353B1EFC
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533640; cv=none; b=X+a/rGba1mHWvFHiyn1fYF3u+lFcNa1YSmnRGen61rhpungYOXDVOKSKvbmPDMcsIKmWZpsWJ9/RmfuWCbftTtB+lhBI8QsyebP2O7c6f4GESu1xX8lxA7r6aNiwhfKBwXbThzI2s8SZtplb9aR2fDZBR+OBW1QtOWYEOI5CXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533640; c=relaxed/simple;
	bh=ViNBLSklZPQRM0ds8F+WFFkGEzCtYSc+f0YcLyNmEi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR6GgZPM2IqC5UjZHrFXwcbniKsqCrXQ6NTX64ftLFstJ4f3wtYQtJfhOQ2lm/kURh9NThDWsdpRe+BJmVTWuDv9PZr6qjRXcmq0pAyqXZfW4tUOAf+aWzQQ9VZecoMHk1YB1mf37t/OME4SHsSSPu87eqaFyo1UYcRXyoA07wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=h3oGHDB6; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="h3oGHDB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790533630; bh=l53zxW3mCIqtbpXnl7Mu35EpsHI8eZf/mbtge73hUQ0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=h3oGHDB6ScIydodkrf8cCAqEkRzgMpZO/FDXrVC2vuU3Fy0k8oV24ixUNNdEkZHkIDgd0XBpDHB3E2rzV/JCiZEx9rvQd/K46R4wgGJ9eoktzibSEZEJGnDYt1EP9JS2oGL+1bYb65Y+B5g/+wgtvN6pWRZFKO1RmS7z6M7F9NMia0ftNmGqV4GbzXH3M0ESd3Y3/XK9LfzodR4FVCRDMUCdt5RCWFAD8MX5ThWYU9R/KC1U69hHAzn9tWR5S1jroX+oOYRNce9eOSikea4xZBdrwJxgjNyulva9puq6PWp2r2XbhdhJlTPxwAaQZOK/LXciWbJs9Dq0EnAux7Ehpg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790533630; bh=a+eBCkmSjyb/RcClgpTl0YvGJUqP4YwK5psjWcnK98l=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Ei8fCqXMfh8GbzwEgnFXZxyDehveUuTI1E92IG1rf0mD3ogjpFHynxH4Iew3H095NUwkCnZHHpDMTVOXXhW0ohE1Ybk17Rjhhrl2TtoGlrVrTBwABNYaS75JI7j6eBqpK/hXqPRS9oR7uCZhXlTm/+KX82t0MVYY51exaieBxNT31rweotFcclfGSvdg0ZmrZfoiW2V0etp2aR1r8wsASUuHvMFOD0i3iquGRPgYfVSM2XACFUXSVJizTaA66rmmBRHweSqmEjZ+uHG7ZSJzZbzAUQPITN+gRXfCMKgVAd3I4f6CYQbrecI+yNoELPXRWCaLN5f4xDLBzPONihIi4A==
X-YMail-OSG: xYfplhkVM1mxsvHTHnldBsjV5XavcaBdPHT1GJ2Ol3vK9gkxkGo0g4hB.NDegvm
 5hd_zqVT4QaPNftYeeQiWGRA4yAcNwMBbDHn48trJobpstiLB0R47gZUSSz_yu3sOEMjqUCW.qa_
 qqlsPtKAyF3M_k3IjnG6VBRtCk4WeKHijHBUzwsZ6RfZp.iZcmzHadi_ncpcYQov6nvboO5JkJRe
 P0vvoIkR_DJJEXP3pDH.ZD9BcMIDoHtKM0Yt7dvbhnsGSCJ5_ypb9Phx8MZy9XNBIx_kLXhL2we0
 bIJNFD7Q4xebDRNoPxQBHG0Kbr.RcuLWU.lh99vEsjAS_lQMd3UIurswkvWtfKbt1LH._DrP161v
 TBak4yaHdodQBvyx7PaBSxlyubMnRTLNtHTb1TAPNxasVgxajpNoR3ImJYGhkr.0n28RLZGiuAKv
 bQLU7sTeR8cD_Iv8D7reiU.ATrCA2Ory0dsne6Pe3psz6pY4ADLfopziTw.cZI0Aie4JQFxGyT7f
 IByZ7JN_FBkoKon1FKO0sS3.V6ns4WgTZVGM9cTJrOm7_vOlQwj.Is30rn72BQGQqhDevGbOGez7
 .BcfC5UaF3jh6IQLf4hM1VoJzpzoIkuT.drKmgYYwqOyICax9qWdbCfvDmuSE44Z7jODjwiFfaNK
 hinamxHTQfVNzeMd069.ar4aW8jpJZlQT.WyoO7E2dXr06csWNAWhLTRyKy3jN9HvnT1JaNTj7U1
 8ypMEUmk_FtyKqqix09us..u3kuAPrRGJqR8Y6PutU2_YlqH4SIUCVh97dWB5oXqfEKFGuX.8p6p
 k4GnW.Q.OBrNttRVxKuIsaDEOqoyJmRm7j8bSe1Cku17oPGHlZJeZxgKm_jjGyWjo_Mqy.iQhA8l
 d_ekzgqa4WPUSyP3XNH3LSGmqGNfFuA8xXIbEe5R0AFgxKI6YZ7JMywQd_iQXySTL1PxfQIm_toh
 .xODmeDsTvWT5.hkwWnN8CqRZ6aZc4Y0iCvuZY5N3hmg8LYekKnGjCiH7h0dJT2oLNRUewth9VrN
 LUNfpHx4_a2RAmhIaOYOWZkvO2pnlKbzcia0gG3S7UbKr.QMcuXuPB73JKW5umQ6Hl3zf32jfQUj
 t3JKt.E._WSJgv0Mm1vat6BXP.t8aQZ.qjvvt5NZruMkaelFynIa.lqoTm1Pf2YG81AuDDW3Q7OQ
 mtmTXrndBWOh_x5SIthDwqWZwoejqjFu7sWVJnWBJGKBJzlfxQppmoEgIPMskE.kHCGUPV2ZVGeG
 S1Vw3719I7mYyIFf3741VxwC2JTcuGe2IjWoJvImfQBw4g5w3vKRIdS43yxf.w4gHvZzAOYLqvhP
 CbZMTQ6lBrC.ySyAEkWxxhlgcrSvI7qZSyFwFyT0bhpqyiVRsz6DL31stge.mjJbgxuZEPvizkEZ
 w2GN8fSZuSadDRd5L1w.PvrgQEOqj9w3f4iasXib_AEJQPFmCzbRDN0g58tv8wydUEWvftGOoWf7
 txhy8pJnTX2KUZ89UskIPoxxunRobgC1R7XS7bHXcCj_uaY2QcNHocNr.Tntzsk4yS64c1o3N7pg
 4eMN9NkSbBkmy5y8Cdr1rsUV27qyaKlP_rIbzlaYv2m6mx.JxIrIueeS3mBxsUyZfdYwSQaD3pcE
 DmIpZU3dh_D8Pu6e9g.aYrcqVCQrRNqbVikCBBQwzrjVGwp3sxIDKIjOchb_dA4Pmt9_ZRObyyGV
 _yiG5kVvXOxRGz6UcBt.TIMGQu2h17dDBTf.P36wP8VpoBK9bpkpjX4ovuxK73HwRsL4VsQAJwdU
 khd14r_cFYzk1aX8AHJ6gfoYVd8VyntZxDwdsizc5Sj8u5J1.mNMKzJvRl.d_GD1vaxaV7doOrS_
 vbERA.ALYoOVo1gxtcTjr_O6vGSHFKSaeZ_RHOsWeIykL.yBFhWqOUVSU.A5x6ylwQOO1uZDtQs_
 1meFtHEJbf143t9XsjDsJryvqO_xJXEfQqQ0QRE.wiUegWWCsQ2vImCOwuAwrsG.kAhbjkWcMAkU
 9kJKh0g6AA5uf.P987afPHAULaOCV4u04ZLMjJXL7I3w1LXoKDkecKP1oYVvXDadabXRK3yur.Wx
 Pd.OoQmG0DeLWV5iSk1aNC8yUMMu6uQDUtFSYEoFH84soV_hn28w720tfnnXyA7Ds_xtsAcx17xP
 tniO0MEmRWIiwSfN3gXkqEJ3iUD3vvFJN8s5zCcPMfaJRiaORPKOjPkEhX9aVck.DoGtypYInsXh
 U6dUnbb6LBtNpUFSRzBfsdIH5iaptiQpTrlU416sFeJL7oHdAZ.nLk7naEuD1Xp5fojFz89AhzT9
 xUbfYQy.G7Oc34GM-
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: f88932c3-cdf9-4ed3-b867-a233ce767963
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sun, 27 Sep 2026 18:27:10 +0000
Received: by hermes--production-ne1-6dbcb84f44-dbq4q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5fc8a42aabb9384b77faa8729bc76f6a;
          Sun, 27 Sep 2026 18:27:09 +0000 (UTC)
Message-ID: <392982a8-f62b-41e2-9b2b-7b5b54ad7839@yahoo.com>
Date: Sun, 27 Sep 2026 12:27:08 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] block/swim: Minor fixes
To: Finn Thain <fthain@linux-m68k.org>, Jens Axboe <axboe@kernel.dk>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joshua Thompson
 <funaho@jurai.org>, linux-block@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <cover.1790408363.git.fthain@linux-m68k.org>
Content-Language: en-US
From: "Stanley J. Johnson" <userm57@yahoo.com>
In-Reply-To: <cover.1790408363.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26577 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Tested-by: Stan Johnson <userm57@yahoo.com>

This patch series was successfully tested on a Mac IIci and a PowerBook 
Wallstreet (G3 Series).

On 9/26/26 1:39 AM, Finn Thain wrote:
> Two old bugs were reported to me by Stan Johnson while he was testing
> my recent patch series, "[PATCH v3] block/swim: Fixes and improvements".
> The following patches fix those bugs.
>
> ---
>
> Finn Thain (2):
>    swim: Return -EROFS when opened with BLK_OPEN_WRITE flag
>    swim: Fix FDEJECT ioctl for exclusive open
>
>   drivers/block/swim.c  | 5 +++--
>   drivers/block/swim3.c | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
