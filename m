Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2556C47DFA8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510895; cv=pass; b=HWsZ9LFZ/0qcNs9vAvTGlbuiJLtywLG4tjZRIWMis7dwOJjNHQ5iazq2Liq3YvVKF4l+5BGZ7IQCaflF+zMTsK97+W8Z7siJqdGhF9ZFRR/O2mEE8robDlrhgQcpLrRDUHUFM8CrMHCaE/qpEDyPBagcN4Ea2crAjLkHBbUbtfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510895; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuvQuky2T/B1TtgHTiw90V2uQaTYdKcM7oqn+2XsamC1EIcfu7JiojmBy7lyLH0J2zIppI2DPKLsvloSnFQ/RIJXdOjs99MELqvXe6+ur9aTfVa2vYKXTRYtPD9x7BfCkr38Bkt5Ss3Fdg3nOr9Rzcw0/6RQC5wcOIv6LLVslZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFeCYDIv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFeCYDIv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYfNs721173
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9s4mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46524220c5aso5637308fac.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=aA97he3mWneERbhz8dG+0sFZV4Ng7iPcufUFlhR+yvGD1wFCBTrxZiqAWigo/H2JCh
         deMVAAlhupuX1Z1MmXYXHUqKTHiRzvrDUBYo1yG/G/zDm/jm9l4Y883w6f6sfzsMxjlj
         DEyfxASc3Bv399+jSZkpHBXb7hKlsLCKilv38ku2Xxo2rTr1WFm5UFjS6BC7xdLKOT67
         ByraAfxt6ZnBjKSL/nYTckTjIbnQjv1tuXocB9cER/JnjTeM2NTpRrnnYHlx+/uZUdsX
         kdG1zCVqa8qpMCwwLDlhWHEKMrzhGYuheFWQ34C+utcU2OG0JDMHTevW0WM7E2JMVIie
         Znfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=YfaqWnD4gNel9liDZ6+6knQ6fzj4WzGT6xN/64kyQ4o=;
        b=Z/CveyNXtfQIe3aGo6xXYRoC3AgRxGbtmTS3X5eSnW13Gtj5Lx+nw5kitBcYQXK2e0
         gokRrMkKEBIMvUMUHh3jHeFRoLlYWBQWZSvqEiE1Sfr4VVO5GWNq54nqt2qlprX/QTMX
         eZHvOlpYsMRfX2+i0Zkex3cWlJkF7r6h+fSO5UFrQPzcY9NFAdVoTnIogdrWrAB6R2Rb
         Xj4rUiqeUxd5s3nkxUKj2oifjHqIT6k5xv2KaSgdwWS20RjRV13HZ0N4VYoJFhF4skF+
         vLw/Yh0A9BQ/NR5HCVVJw9Ii5cSI+GJaRkeBxumab5ByCYGwRfE8mdEkYo6+aP+M/Iqv
         DjHg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=RFeCYDIvo++9m11PQF7RNE3HxsGFxU72Ad4+TBf6mdcojZCMJIGrK7/26YyC5xz+xg
         2RgfjDcAZmycp2UX4dPf6RQdoWo46KQKra9NtIYeKoU2CCmOMBjn7rD9PQbycxExygDs
         hIuQXClX3t8P3afq6LaIYatxmbKhXhjvdTzsVTzmfjxnGAowI9+13zEgtO+S2YcB9G84
         BnPtDmPH2IKICY3JkCVd/sR28AI8aZF3DyZYyUNT1iji1ubWsWSGa3PPUFrmsUmvBecr
         n1KpxBryiHDPqeUvJMgnYYflgfYafVRNCyJCAwy82buMUZQOnr4Qtl+9cjl5XhKBUAvb
         O73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=pA83HvidBURPLf6mLDL2DgnHcrliejB+Dd/3n0f+m8Hfr+u+K4gKl0eskKFEsCyd9K
         d5iSlfEJYZ5rcFIl26iEk7JQGIVZwLijaLnEJht/HZbiWo+G9oapqEilQi0vhtFzTBJF
         BpV7n5/klqc+pY4hx6RdgABYSe5qRa5G9NFA58C0GvBeHUY5PbRvR/GU4/Cxhm+BLzrG
         642DWi7J9Bw/0VPY1f9J/GTYu1qlsXBF4J9jKP27gYxQ1c3lNGqxT5xYFjtuZWHVcm31
         CIRqZ6HKkt3RcYCkGAxifM0Z4I4UqDyaY00u293oM+qoCXvEDQrN7YOs8lv8Zi2S9Kx3
         pkUg==
X-Forwarded-Encrypted: i=1; AKwUvBw8/QUSEyBqkx+ukZZ8Kv2JxGh4nLJAIv25Jk8SPOrZGbr3BOBByXD+fc80EXspIPVAlEHz3YqjRKeM@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kJivL3Z7NujkldNJyrY1CmDd35IznajZp8bqPtHwBkRVZ/U49V
	uq+r6+x2q+bjYw7dvvLBe+DUhmB+9/tGuEFY48Dcmb0mnnK4nSR4SKRfhSj4kA83/aenwP+K1H8
	KfCwIPY5y+V7TqO1P8U233p11R1K5Lp4HJOVHFyiDKtItDJCLf5prnP0f1OiKeupt12ct9LNTlI
	DfHci4DgmpzRG4ua2OYWfiAddvQxWiVJewO8bOz31Q9c2ecg==
X-Gm-Gg: AYBFou2bFgKVfuhHyW10klfa8U3Ek/utmIfbt/rpI4P/hRQOOVPnazQ5K8EAvPbLLCq
	7uVhUQZCfQXsVa4Whpi4GspkoYVYVkqBZamSuBWSInZXguwLfShvFjKgicKHYELDN0uvW5lKzln
	uswpw2qnByXMpNPkouLsSSBrHoQu+Etz177IdHgESqaH/CES0HHoFilwTt
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189785fac.2.1789510890909;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: 7xeuwGuoSrPzTDpmEtEejRhVFM5Td4Ce
X-Proofpoint-GUID: 7xeuwGuoSrPzTDpmEtEejRhVFM5Td4Ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX8tgqB9qjorg8
 Z52Y4otOJtCuCVcTlUy+sg4qw8omfCvjJ5CNpGiz3rJeaSW3OVZqegcS535g1QS1ZILsBsLW6+v
 Xi7nhoZl8RkvlOhPH/JooPYpyG7ufxdlotCNkqZFkZlI5FogLiC0FjYctYUx95fpXsqB7UBmrCk
 Lcf7K8Pdbbketrx0WMGuwEnWp+6EAeh4ZW91PXqIE9Qn8UnKYO8yne8E1potZgV+qGl9+zo4Gyo
 adFpPa9wS4Pl6kA6UsdvfL87cTqv4I8e+Pe57QTaY9OByD3D7BxagB436+h1U7nSnxJEkAAe7jW
 nFkjVnwiIQrS23CImHdulnhdMwxVLnCQ6X5xv4So7F/BPiqQD2igX0wsQiyO2uPlfmaEpA14vIc
 WUjICPIYU7aIBhmFigLZM2k+jyng3EwPDKLgTllOaEzOEtSmlKVkoiU7AQlr+hJuKDJGHakjjy2
 uLhecxpfmHxXkKzWOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX9fBtrN27+E4t
 gUzI1Z8RPudP2IdaoLI9uVGxcS6XJHrEaJgKJW9u6n3dgMcfCCBjmxxuFFUFuTjYBD4TrZ32r4Z
 xt2n7NX//7UKh2CbLIA3qVg4edXuHvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
